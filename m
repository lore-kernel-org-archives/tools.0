Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F32591C
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 20:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01B55C433C8;
	Thu,  3 Aug 2023 20:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691096210;
	bh=/nfc+cQ7m5s5EAxKGV5sJqFUJWZxRTqckAgiWcBZP+c=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=pBgmIZjx8kTbtYmM4yKC38V3orUNuXxLXPo8NTgqqGVNSykAtakfOSxYzbkUIgfdG
	 K2Q6+wS5loxnXot0QJl/e6/YXJvV4wPjgXDq33R1MykudOEu8Sz7PUBH5CiTzukJ3H
	 L+zF/5TG796ybGDSilJ3dpIQaItxUeS5G+M1WhE4wXu0nAklEee43EBFItpXEfh3ju
	 5LE9qTpIrsCnHSRqJJzzikcTmMcc5KF7QHsr6eMGq5BCRew5Ou2gSLoqCX/2+XdiyO
	 gUmu8r+HTGihoAZ4rxFDPv7bFG6HCxrBEe8aMga1pKW0w8N0/WXt+IXzakLmmMNasD
	 xmg8whK60j+FA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D59F9C41620;
	Thu,  3 Aug 2023 20:56:49 +0000 (UTC)
Date: Thu, 03 Aug 2023 20:56:59 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, mjg59@srcf.ucam.org, 
 tools@linux.kernel.org, ndesaulniers@google.com, icon@mricon.com
Message-ID: <20230803-b217332c13-0b640aa9e69e@bugzilla.kernel.org>
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Subject: Re: b4: executable sendemail.smtpserver and b4 --reflect
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1

ndesaulniers writes via Kernel.org Bugzilla:

I think https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=8382882b9fb6c50737b6e19198a259850527d2a6 resolves this issue for us.  Look forward to the formal release that contains that. Thanks Konstantin!

(I don't think I'm able to change the status of this report in bugzilla to Fixed)

View: https://bugzilla.kernel.org/show_bug.cgi?id=217332#c13
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

