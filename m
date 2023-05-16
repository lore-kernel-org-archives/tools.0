Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E2B3C15
	for <tools@linux.kernel.org>; Tue, 16 May 2023 22:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07ABDC433D2;
	Tue, 16 May 2023 22:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684277922;
	bh=iCX1x2ixHNK6nIhApUHus/mtOpn+WAjWfH7DB4RybLY=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=i9FTGr/oDrgyHbB5BOKTfHzGF3VsJXv0tPAsmOWaMruXoSumwGPpFhBhdDSTc7kaq
	 643AE0dgvsBna0XHL5x9MNy4A8+vO3OSPq68692SYucriufUR0FR5+z7GDRHTA2fOH
	 pjAOUPlwVOeRORHqqsvMAHwXI/5ucFZo9rAGmCU7FaFN6QrUs9QKNZ/6JWrm9e5pUq
	 HZuV4XrnCsFPFDTj4HPDPScePAXOi7ZDz6d8a7DUVn8WZQz++KWwhpM166QbZTDwAx
	 tZovb2BlOT0r7noKoOTSLbW+dbCwMg90ZjB1G2ZacASCa/UuWVfbFwh9V5yrVshQcO
	 yLvz+SfwUZl/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC387E5421B;
	Tue, 16 May 2023 22:58:41 +0000 (UTC)
Date: Tue, 16 May 2023 22:58:50 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, icon@mricon.com, tools@linux.kernel.org, 
 ndesaulniers@google.com, mjg59@srcf.ucam.org
Message-ID: <20230516-b217332c12-952b313169dc@bugzilla.kernel.org>
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Subject: Re: b4: executable sendemail.smtpserver and b4 --reflect
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1

ndesaulniers writes via Kernel.org Bugzilla:

(In reply to Bugbot from comment #0)
> Nick Desaulniers <ndesaulniers@google.com> writes:
> I also noticed that my name wasn't being sent on the From: field to
> LKML. I assume that's an orthogonal issue, but is there anything else
> I should be doing there?

(In reply to Nick Desaulniers from comment #9)
> I spoke with the maintainer of our internal `sendgmr` tool; they recommended
> that the `-t` flag be used.
> 
> https://man7.org/linux/man-pages/man8/sendmail.8.html
> 
> Can `b4 send` add `-t`?

...specifically not when using --reflect? (Happy to file a second bug to track this second issue, since it's orthogonal to --reflect).

View: https://bugzilla.kernel.org/show_bug.cgi?id=217332#c12
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

