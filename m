Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083BB430B8C
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772310222; cv=none; b=JZi3wi5iLUp1oYNTpU/L3qFn1nWzBwKAuq269tI23exMJgrYbFGOpDtJ7DnmqvJ81ibfpKYy/jGjeIGFgwu/Cw5HKRgxJilBSMK1A94jxhwz90soidDma8t8rKLineDGverTk+9qE8L9cDaR4on6HrZMAsQJYGBdOGIn9EUZrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772310222; c=relaxed/simple;
	bh=GR7RCPh2pAxCLqrn5e1DlNXyyXG4oj4lyUTjLCnW1oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=B23/p68eIKHW74Sd0xxwEm2Bq0Czx7LGiQXncGdQM24FbdL2i/lcS7xxqWPP3RrGNNIkZJhmOecTAxbfjC4PCZSqAooovyb61oWQ/yAviIkSFU9yL0+mxnXfcXsPE9wKqzj4N+1ETTT0nO8t/LMltQl7hTTGwQBniYPW7x7gR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eOjZDbG/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eOjZDbG/"
Received: by smtp.kernel.org (Postfix)
	id A8C2FC2BC87; Sat, 28 Feb 2026 20:23:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A80AC116D0
	for <tools@kernel.org>; Sat, 28 Feb 2026 20:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A80AC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772310219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rNG++5wISf1/bT0xaePBDO0CqkLH4rTsF6qlImG0dpM=;
	b=eOjZDbG/TeOBAcStSLOQjU2vn/K4evcGLh+0KSS/zVugtxQ2ebOBwvgXe1WILZRk9u7kw+
	xNPiu9gebI1kxW4cbKteKso7cHuwvkeNZ05JRpzD23vtC1OTlSEM2ScYVtVv2I4tVef5vA
	JTGPkSwGPp1tDN3pwpwDn7E2NhHxkac=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-x7K-HbPKNICA-fF0mjinCA-1; Sat, 28 Feb 2026 15:23:37 -0500
X-MC-Unique: x7K-HbPKNICA-fF0mjinCA-1
X-Mimecast-MFC-AGG-ID: x7K-HbPKNICA-fF0mjinCA_1772310217
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4839fc4cef6so38253435e9.0
        for <tools@kernel.org>; Sat, 28 Feb 2026 12:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310217; x=1772915017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNG++5wISf1/bT0xaePBDO0CqkLH4rTsF6qlImG0dpM=;
        b=C7TOk7MYO52hEHxV8YxziyZh1VpNpstEnywcS/E94ADNSZW0kCjM4fa/qJ8X0SXtm9
         Z26mNntnLcuRJ1f5/1pfy+WfIaw9qVeENtaamzIsY7gNXud/XDXFkMLMGXd1LM4CXqF+
         AZPvoV0iCALrE3AgPL4iY+moV10EnHqkx1wCtcnXBX2rvLEs0sajaZ6qTUlhhnVQPyfk
         zXEG3Hz4AFQt1g3B5USHDXQ6DmUerdzTnkmpvVXy+i8mVTfHyrEs6IUkLhD3c2oWqKS9
         pQw+kWyR7pDAHJ7UDiXBpwkKOpLgyujKwZmTVPWfUW4lsMOQAJELBRwIbQUfeY78N1jy
         BoCg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Cdjjih6WjFbBcHQ6THxThT6oIKwoCa8KpqCgyKwqCtS8SeRpgkwVGibkPXRlOZfv9pwqYA==@kernel.org
X-Gm-Message-State: AOJu0YxtTYxzHns5w32sIK3Fpi54BCeyWbZCj0HwyI7TRzr6T2qCl4R/
	eMhiVGJKFW4+GbXYSBvXnDA3bu+F9Ee0wSFsM95hYckRyc+B5PBAtAk/pVKHnQc98TgMdFI/kuN
	K5JToy/7s8d26j+AxJKVey4BuMa5WsGc8mRqlAJ9q3RIxWP/hyQ==
X-Gm-Gg: ATEYQzyOJIcy2sjZbEeMRpdlv0NYYOd3YtOT4zxt0KRMEX7mNpDqvabUp5j3+eWyBDZ
	bVGScQ8C8BdwX8bbfnx8oUyaetas7yRh0ANCFS8wGeKA8JHHaOijm5g82E99/U9hb95uCgwnEer
	GPEinVZ8nKQuz8GkppUrobZf03lSVDFlRiaT+o0R2uN+V36b7tT1Px3OyxIDbQm5VFTVGSqVbn/
	qkOxcB9iQDM/7kGUn8wlS9i4Tj9Jcuvm4XImIWFjfOru7hAa1cBJqQjyzQ2YCyLX+plAOqAT/+z
	oM4agMY6bjo9t//U9x/M71wTcuCGPcBO0s1Yn+A5STqsraQHG6OHamVSef5+Aieixooat/iEARw
	IxD9EBSB9ZRRSyyziFQ==
X-Received: by 2002:a05:600c:5608:b0:483:a2b0:d210 with SMTP id 5b1f17b1804b1-483c33cab2amr115276435e9.7.1772310216537;
        Sat, 28 Feb 2026 12:23:36 -0800 (PST)
X-Received: by 2002:a05:600c:5608:b0:483:a2b0:d210 with SMTP id 5b1f17b1804b1-483c33cab2amr115276235e9.7.1772310216010;
        Sat, 28 Feb 2026 12:23:36 -0800 (PST)
Received: from redhat.com ([2a06:c701:73e3:8f00:866c:5eeb:fc46:7674])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm4820208f8f.5.2026.02.28.12.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:23:35 -0800 (PST)
Date: Sat, 28 Feb 2026 15:23:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228151029-mutt-send-email-mst@kernel.org>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228125823-mutt-send-email-mst@kernel.org>
 <20260228-sparkling-beryl-kagu-8c34c8@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260228-sparkling-beryl-kagu-8c34c8@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M0HGQOuBvcOwfFOV2u8xIqsIFnd-JHI3KJtUlLMxo5M_1772310217
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 28, 2026 at 03:06:34PM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 28, 2026 at 01:31:04PM -0500, Michael S. Tsirkin wrote:
> > Amazing, thanks for working on this.
> > 
> > 
> > But I could not get it to work with gemini:
> > I have:
> > 
> >     [b4]
> >       review-agent-command = gemini --sandbox --allowed-tools 'Bash(git:*) Read Glob Grep Write(.git/b4-review/**) Edit(.git/b4-review/**)'
> >       review-agent-prompt-path = .git/agent-reviewer.md
> 
> Thanks for testing it out. My most salient recent experience with gemini-cli
> is staring at:
> 
>     Trying to reach gemini-flash-3-preview (Attempt 6/10)
> 
> and
> 
>     Agent reached max turns limit (10)
> 
> (Sorry, Google people -- just stating facts.)
> 
> However, I know the following things:
> 
> 1. Gemini really doesn't like reading from the .git dir of the repository.
> 2. It also doesn't like writing to that dir.
> 3. In fact, it only likes writing to the toplevel of the git dir you're in,
>    and into ~/.gemini/tmp/dirname/
> 
> Gemini itself just recommended me to run with "gemini --approval-mode=yolo"
> which seems like a pretty terrible ideas.

On that, I'll send another message)

> However, I'm now looking at more
> RESOURCE_EXHAUSTED stack traces from gemini, so cannot test this further. If
> someone with a more reliable access to gemini-cli can recommend what is a
> better approach, I'm happy to implement it, otherwise I'll try again later
> when Gemini is less cranky.
> 
> -K


The following seems to fix it.
I am also testing different models and some of them
interpet "Read the prompt" quite literally and just read it.
I think it's better to change that to "Read and execute".

-->

review: fix review with gemini cli

Gemini does not take -- before prompt. the prompt we supply can not
be mistaken for a flag, so it is not needed by any agents.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index e1c988e..12eb146 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1313,7 +1313,7 @@ class ReviewApp(App[None]):
             self.notify(f'Agent prompt file not found: {agent_prompt}',
                         severity='error')
             return
-        cmdargs += ['--', f'Read the prompt from {prompt_path}']
+        cmdargs += [f'Read the prompt from {prompt_path}']
 
         with self.suspend():
             logger.info('Running review agent: %s', ' '.join(cmdargs))

