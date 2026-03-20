Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF8F3D3D16
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025558; cv=none; b=bdquBSU/x7lj7sL1aXeqbuN9+HMovNWsYztQ/grxFJbaOYWrI1qdrp1mcH74Sso/lJNnSkOJ0VhM+nnrePMIxd7PuL6+Joz1fpFTKgRpC9lxE2pG1zi6nXE+nBAxGmbKbR0Bj+C6IaAUoDoPaO35PPkfVNxElHhxDk9mwm7DlEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025558; c=relaxed/simple;
	bh=TZVE9pBF0yyNCRhwYnTnRJhXsigwXeyCC9rw2/3cfJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hWdac28cwA70zVInjoeO7BfYTOCsP86KZepyVa2zfnmOO0Jg9LfJsFiarHtiiqTalyCqUHJxsqarYrJ5umrYu1nUoxnQF8MjcNcKvL04yRumAGgvqE9yYldNOZQSgLl6+X8qVbnBS8gDH9n8a9bCHHhoHZp6AdU4oAAT3PPGQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0WMfGLhv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0WMfGLhv"
Received: by smtp.kernel.org (Postfix)
	id 72AA7C2BCAF; Fri, 20 Mar 2026 16:52:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B34A8C19425;
	Fri, 20 Mar 2026 16:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B34A8C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E83EC4E4274C;
	Fri, 20 Mar 2026 16:52:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A007600E0;
	Fri, 20 Mar 2026 16:52:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6616B10450CB3;
	Fri, 20 Mar 2026 17:52:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774025554; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bTnQj5G8BjKXYpQwQBtVx4C9OPDY0X+gkE1s2eOqkFY=;
	b=0WMfGLhv3be10Aa9xCojD1VyfcGrCRhovuktA8hwD3I2S+sYsy6pMV54uS++rUONSCgcoQ
	HzDumkSV5Y/AJzcYQ2CAFh0GQW0fiyIUBEul2ebuKyKyF1pA21YB359/GCq8fbX8+pIeXm
	jc2AaczdxTsvsAMoXnMKEvCaG1s2UmbIP2LDMVJoH/fnCGgNn9Q1lsJoyFPnYvw6/QCiz/
	+6LSNXCvshxqjZaJzmuAtRXLC3kVDkn5ctlslSiQIqv5s+IGiDl9Sd945QjI92+S05tAZ4
	TtBzJlHmlTCrotx+Vm1XbNiUaz8Dmm20h9By78EMfRatboh+uqScbXtCzY8NfQ==
Message-ID: <24351d92-3f8c-412b-807d-ed7ee0b1ebf6@bootlin.com>
Date: Fri, 20 Mar 2026 17:53:12 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 review available in master
To: Konstantin Ryabitsev <mricon@kernel.org>, users@kernel.org,
 tools@kernel.org
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 2/27/26 20:53, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> maintainer duties. A getting-started guide with screencasts is here:
> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
> 
> It's available from b4 master pending initial testing and will be generally
> available in b4-0.15.

Hi everyone,

I’ve been testing the review tool and it’s working very well! Congrats 
for this tool!

I’ve encountered a small issue while trying to review/test the following 
series:

     20260313132103.2529746-1-jim.cromie@gmail.com

When forcing drm-misc/drm-misc-next base, the check fails. I tried to 
force the acceptation (^y), but I got a git am issue during the branch 
creation (I fixed it manually, so my issue is "solved").

According to the documentation[1], it should use git am -3, so I tried 
(in an other worktree, rerere disabled) to run b4 am -3 && git am -3, 
and it worked (you need to fetch https://github.com/jimc/linux). I don't 
understand why it doesn't work in b4 review.

Did I misunderstood something in the documentation? Do I have an issue 
in my configuration? If not, can you add a way to apply the series with 
git am -3?

Small list of "stuff I found when using the tool" (I totally accept a 
"totally useless / don't have time / bad idea", the tool is already very 
nice) :
- Add a way to see application logs (notably git errors)
- Add a way to read the existing trailers to mark patches as "done" (in 
the above series, I already reviewed few patches, but they are not 
marked as done in the tui).
- Copy don't work  in the tui, it is a bit annoying (for example copy 
git hash, text)
- When you exit, if a process was started in background (for example the 
base check), they are not cancelled and the tool waits until completion 
(not an issue for small series, but in my case the series is 63 patches, 
so it can take up to 1 minute)
- Add a way to select and add trailers on multiple patches at the same time
- If a trailer is added in the `reply` interface, don't move it, I often 
use and see stuff like `with or without this: R-by`, this is 
"contextual", so could be nice to keep it in place.
- Add a config to disable "autosnip" (I understand the goal, but a per 
patch "on/off" could be useful)
- Add a "quick shortcut" to add trailers (t -> r/a/t/n -> enter instead 
of t -> arrows -> space -> enter)
- Add a way to disable the scroll animation (pgup/down do a "smooth" 
scroll, which is very strange in a terminal) (very personal feeling)
- Scroll using arrows/pgupdown/jk don't work in the "send email" 
confirmation list

Best regards,
Louis

[1]:https://b4.docs.kernel.org/en/latest/maintainer/review.html#conflict-resolution
