Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9164E31B13B
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 18:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772303474; cv=none; b=EWpZNExIfey8ygvTXEbRfAqDErFQVPAOkDYjhPla+768lSizWMJegDbbFjswxvp5iRSsMknpirW8gbr9yfTSCbXss/1Ssli0e+Kxtw7vmDzLoI9Mwprxnt2eYIdI7sHEZSJi053y7hphiZ5IU3OxOPjyGchbq59yWjugNnb/Ua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772303474; c=relaxed/simple;
	bh=vJBNDkOuhBUUkplhrx8wVvwMNAFW1c6pfn/wCsGcERA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=S9qX2xPGQc78ucnVp6sACxAJkL/z4oOzJv6He7EeCTxyAJf2Q1J34uI9dJ3tFR4LgSbMG/YjfhDlIMfOk6o8vyxzg+lwTWZZxIL0OjYM4J2pjxrX0KcGdfFUzvjQ4njTn8X7zdvubxiLkFWIaFBZDQq90euFWOVDALndemrBD88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e3MUcdiM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e3MUcdiM"
Received: by smtp.kernel.org (Postfix)
	id 5F616C2BCB0; Sat, 28 Feb 2026 18:31:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2EB1C19425
	for <tools@kernel.org>; Sat, 28 Feb 2026 18:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2EB1C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772303471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=naEuxs/Ma/h0+NzTiv3WPmFJebtatexCNHWsNyOCIac=;
	b=e3MUcdiMiAyV6ABUwG+aVhZk+a9PdsafU8rXjo48WXEaIHdM1nSvOUx8Plf+08pvbxdc0o
	UOR3OBQgruNzQtuwfrMi7oV32M2OCTY8/P6etdmFZym7stCIrUVe/+ewLil0alEaHtccZB
	hn5zagQA8hngx21pUIkgzgcoo0wJ0vU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-jB8Vk2cmP3CLDKuFjUHxxQ-1; Sat, 28 Feb 2026 13:31:09 -0500
X-MC-Unique: jB8Vk2cmP3CLDKuFjUHxxQ-1
X-Mimecast-MFC-AGG-ID: jB8Vk2cmP3CLDKuFjUHxxQ_1772303468
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-439ab866bc1so543040f8f.2
        for <tools@kernel.org>; Sat, 28 Feb 2026 10:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772303468; x=1772908268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naEuxs/Ma/h0+NzTiv3WPmFJebtatexCNHWsNyOCIac=;
        b=HIIBOXxbXGbGmgiR0I5LdfqE+OAieCnbLiQORebZFDqmrmdCYL2JNmZyO0Hmttk4ZP
         UY9rWeoooNDP7vMoX0NVUn7px4RcLYMczgeME1hveuGolZoKJFRdCWlPDBF9PTk1P1I5
         ox2DfRIIAQDQVL9DZRX6Hapx2nMDWtV7rVqY7EkqX0GinINp+hzLbTUpMkGjJ6OsNur2
         Ymq75R/BoQfK8E8bj8D6K+mCRj92bZCAonMJJ9liK/Gcsrh1SB2UAFAtyYgaNxggAloT
         HaKlL+r8JSstNHx5s2rVC/zx8Vrj5Iyq5ECGRVTUp+Xkx1/JBdJEvD1S7VH5HJN0JncJ
         mHEw==
X-Forwarded-Encrypted: i=1; AJvYcCXl6q/K13odZywaCgawI4RIQHmby+e3tcsx9ZpYHx2HYMP0S3bwb+fPjE/oeZ+UzQgd3weMhQ==@kernel.org
X-Gm-Message-State: AOJu0YyMWK9yic4VHOwN3xJLUbSwoW2PxZ04v4pD+7BdhwuzyZHXsn98
	hUDesbWDjgHfP2sHro70nuk8Ktk/UkmOwPhA5286PE9j7QpV9tddP3HPbSDSe9SyyKnwpHpduWI
	4TTyySUpJeRtteAhTpzrFqkHSIAZ6QJWqIzpknLJhu23a1XQY4w==
X-Gm-Gg: ATEYQzz/UXDk/t8q+ef5sGK4O80RJXppXFqd4QHsB7TTCEXAw4f1lmYyhzVe/9dYPIu
	3USVmKxi1K4whSf7JjXHlm7bOidoeDWTr/vBe+rYV+NQepd0JcuIFjpjh5k7hkx1WLyTyvCnqiZ
	chLUy708xM/6DGGTIKwvlLAOGgRn5iOtiSkbqoJfLFdZingz9AO5PaaQCy04ft2dcWlBP1By53u
	v7aJ2vDM55O3OcWhEF+UgUU98v1cZatBpr8GsjaL/8QaS+/UDZuNhkXCUjIylFwtcB6bsrRFf1Q
	tmQK1nEKzaLO7wcKAc9F6t5W9yK+8vWw4cgsClMaNpW3CguHRQareluvKAJLDz9gBgKV7A96eXj
	mW8NMTFCHyiqxd+G0WA==
X-Received: by 2002:a05:6000:25c3:b0:437:8f37:887 with SMTP id ffacd0b85a97d-4399de3e4f6mr13856569f8f.36.1772303467958;
        Sat, 28 Feb 2026 10:31:07 -0800 (PST)
X-Received: by 2002:a05:6000:25c3:b0:437:8f37:887 with SMTP id ffacd0b85a97d-4399de3e4f6mr13856516f8f.36.1772303467412;
        Sat, 28 Feb 2026 10:31:07 -0800 (PST)
Received: from redhat.com ([2a06:c701:73e3:8f00:866c:5eeb:fc46:7674])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b0549600sm711580f8f.35.2026.02.28.10.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 10:31:06 -0800 (PST)
Date: Sat, 28 Feb 2026 13:31:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228125823-mutt-send-email-mst@kernel.org>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AwrC6wmJ2rznVgNtMSaczCQ11WZY0uwYbFJa2W5feAs_1772303468
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Feb 27, 2026 at 02:53:07PM -0500, Konstantin Ryabitsev wrote:
>   - AI-assisted review using an external agent (Claude Code, Gemini CLI,
>     OpenAI Codex CLI, GitHub Copilot CLI) — agent findings are private to the
>     maintainer and can then be selectively incorporated into the review
>   - Patchwork integration: browse series, view CI check results, track series
>     directly from Patchwork, and automatically synchronise Patchwork state as
>     you work
> 
> Watch the screencasts in the link above if you're curious and please try it
> out. I'm sure there is a ton of corner cases that are not properly handled
> right now, so the more feedback I receive, the better.
> 
> If you want to play with LLM reviews, you will need to specifically configure
> your agent. See docs for that. If you don't have a subscription available, I
> am told that there is a program for OSS maintainers available:
> 
> https://claude.com/contact-sales/claude-for-oss
> 
> If you know of a similar program offered by other LLM providers, I'll be happy
> to know about it. I've tested claude, gemini-cli and codex. (I did test using
> ollama-based agents a while back, but the results were a very mixed bag --
> there is usually not enough context available to these models to perform a
> useful code review, but ymmv.)
> 
> Best regards,
> -- 
> KR

Amazing, thanks for working on this.


But I could not get it to work with gemini:
I have:

    [b4]
      review-agent-command = gemini --sandbox --allowed-tools 'Bash(git:*) Read Glob Grep Write(.git/b4-review/**) Edit(.git/b4-review/**)'
      review-agent-prompt-path = .git/agent-reviewer.md


and this runs:

gemini --sandbox --allowed-tools Bash(git:*) Read Glob Grep Write(.git/b4-review/**) Edit(.git/b4-review/**) -- Read the prompt from /scm/b4/.git/agent-reviewer.md


But this just gets me an interactive prompt:


Running review agent: gemini --sandbox --allowed-tools Bash(git:*) Read Glob Grep Write(.git/b4-review/**) Edit(.git/b4-review/**) -- Read the prompt from /scm/b4/.git/agent-reviewer.md

 ███            █████████  ██████████ ██████   ██████ █████ ██████   █████ █████
░░░███         ███░░░░░███░░███░░░░░█░░██████ ██████ ░░███ ░░██████ ░░███ ░░███
  ░░░███      ███     ░░░  ░███  █ ░  ░███░█████░███  ░███  ░███░███ ░███  ░███
    ░░░███   ░███          ░██████    ░███░░███ ░███  ░███  ░███░░███░███  ░███
     ███░    ░███    █████ ░███░░█    ░███ ░░░  ░███  ░███  ░███ ░░██████  ░███
   ███░      ░░███  ░░███  ░███ ░   █ ░███      ░███  ░███  ░███  ░░█████  ░███
 ███░         ░░█████████  ██████████ █████     █████ █████ █████  ░░█████ █████
░░░            ░░░░░░░░░  ░░░░░░░░░░ ░░░░░     ░░░░░ ░░░░░ ░░░░░    ░░░░░ ░░░░░


Authenticated with gemini-api-key /auth
Tips for getting started:
1. Ask questions, edit files, or run commands.
2. Be specific for the best results.
3. Create GEMINI.md files to customize your interactions with Gemini.
4. /help for more information.

⚠  Warning: --allowed-tools cli argument and tools.allowed in settings.json are deprecated and will be removed in 1.0: Migrate to Policy
   Engine: https://geminicli.com/docs/core/policy-engine/
                                                                                                                         ? for shortcuts 
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 shift+tab to accept edits                                                                                                       1 skill
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
 >   Type your message or @path/to/file                                                                                                  
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
 /scm/b4 (b4/review/20251013-b4-sparse-checkout-related-fixes-bad772cc2a80*)           sandbox-0.31.0-2           /model Auto (Gemini 3)



Thanks!
-- 
MST

