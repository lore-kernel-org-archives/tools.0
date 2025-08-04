Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888F2376E4
	for <tools@linux.kernel.org>; Mon,  4 Aug 2025 20:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754338507; cv=none; b=kgx5oO9hGvqU7R9DyV+js4CoqAdubPnusFfx3ypNiu+ZCmXBSyKoWZYKplN8phMRzINBJ0hFKhO98C6wLaK7EhhGPzRzXQ8Bsx7XYYUuin3q/TDYwhGJt3Qk0/+FlT0BhZ6jtT1NE4Be+pr7Xhv/+CeI5EwBF7mv9zjHXkQPQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754338507; c=relaxed/simple;
	bh=3h1Cgx7NmGKCvq53NTQjsw3LVbV7RSXF/pZ+yHzmKAw=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=UZtq54YVuFpmJ+w2dFDQSVDcf8HR7edEOnYMPdOPRnC9zGBafGq2k+nPnsTv4YsdnGusv8lvfy8vFy0/vi8JhTOhAUtdbsAoYZuqWiREaQ0lSbCqCIVyoCBYo9Pka5httHEAZwy9ZvHEqf9OS88c8YIGAJ6bH3Hc9oYbPdhwGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3JHOBqD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3JHOBqD"
Received: by smtp.kernel.org (Postfix)
	id 621F9C4CEF7; Mon,  4 Aug 2025 20:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FDCC4CEE7;
	Mon,  4 Aug 2025 20:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754338507;
	bh=3h1Cgx7NmGKCvq53NTQjsw3LVbV7RSXF/pZ+yHzmKAw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=T3JHOBqDuos9rgoKmgHtMVkKRewkwsKItiEG2izdSJ0TFiHJnwg/ewXqrVdCy+ptH
	 0QIuXDHhPSGb2OA1UAIWob2a55poiMSid/AGzEuKGN7fcJsOZMKB3S5Jt+6XaHsD5R
	 krJLrVzJHNRhMci4UG4xOR45hOSMPeSBF+gMZqSybbXl9hoxe4yJ0cHzXXa3IkMzgd
	 niX8VE5nmfCpvNb1ZMqo9KW8fketgPpVu3aKKJgsQQjpxwsfd6ohopBGRzwWWy7gTg
	 2Krxu67CobC3yHz5EbBg6c4tIeg4WhVIWYHXn1h1LeuSdqceUsfmPjUAPYAMkeojMq
	 3pyGBnWnCjW8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1F2F383BF56;
	Mon,  4 Aug 2025 20:15:22 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, jannh@google.com
Message-ID: <20250804-b220411-377bf7a05164@bugzilla.kernel.org>
In-Reply-To: <CAG48ez2OSJd4ZSfan3Xn+=qM38Dbm8jhUBby8n1aRtYaTLQ26Q@mail.gmail.com>
References: <CAG48ez2OSJd4ZSfan3Xn+=qM38Dbm8jhUBby8n1aRtYaTLQ26Q@mail.gmail.com>
Subject: Re: b4 feature suggestion: rolestats in --auto-to-cc
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Mon,  4 Aug 2025 20:15:22 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220411

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

