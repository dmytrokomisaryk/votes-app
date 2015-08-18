module PollsHelper

  def max_votes(poll)
    result = poll.options.map(&:votes).max

    return 50 if result < 50

    result
  end

  def votes_in_percents(poll, option_votes)
    return 0.0 if option_votes <= 0
    option_votes/max_votes(poll).to_f * 100
  end

  def encoded_url(poll)
    request.url.gsub( /\?.*/, "" ) + '/' + Base64.urlsafe_encode64("poll/#{poll.id}")
  end

  def already_voted?(poll)
    used_session = poll.voted_identificators.find_by_user_identificator(session.id)
    used_ips = poll.voted_identificators.where(user_identificator: request.ip)
    used_session.present? || used_ips.count > 1
  end

  def mark_as_voted(poll)
    poll.voted_identificators.create(
        [{ user_identificator: session.id }, { user_identificator: request.ip }]
    )
  end

end
