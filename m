Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8E61917CB
	for <tools@linux.kernel.org>; Thu, 29 Aug 2024 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926751; cv=none; b=PzzynGGzS7bXWekPNKzM0Eqi+623JGN3NU2MfEFp+q/2ndE7yWQW4vU1n1JUGdPRlRprevjbV+KcrWg/1ZgF/5hd6RvJLEgz/4fou3Hdeb5TdekD+SwOHz1oi5BIZkSJs93Uh4+V4ldT6fqhRGXWIagQFz9nUoIgC9Jdd7jB/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926751; c=relaxed/simple;
	bh=WSlMcogP5MDXFjnWF2DnNHstYEDb5epJ4AiVdKeYkOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=XUwLQyLIvhg48wPM3L1ORzPzuVedNmaU9aKoHKu0sovra4lJeaHV1Y6+bdBP+ymBRez3l/y0LMCS1Hi4EletxMr3HB3/DVptPUUJuHVS89iR0+QVKcObB2xP0L626rqZ2y/aRKQ4oVWQ7J9+wLbFdqJ2A+IbuvLdA7TgUiTNI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uvpZfBHm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uvpZfBHm"
Received: by smtp.kernel.org (Postfix)
	id 8A717C4CEC1; Thu, 29 Aug 2024 10:19:10 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95E01C4CEC3
	for <tools@kernel.org>; Thu, 29 Aug 2024 10:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95E01C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a843bef98so40182966b.2
        for <tools@kernel.org>; Thu, 29 Aug 2024 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926748; x=1725531548; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oBIibW6bVR5APpJwyC85Xdt8Tuc8bfpaj1B3BDF3PDE=;
        b=uvpZfBHmALRfrdj93oS6P5zS1mDONazjiWm18jbKxRuHf3LizZbiF7RTrC71s251q4
         SAia5x2TlWxZfxDSTmzs/DQqiePhqsNIb3VtOj6ixIgB9KWDkwduEPaIOWve65Rm0rqZ
         HjNt8ZB+G8tPB5DfuXTBPzr2XvHjqJ53mODBHjS/1KdchQv8D4hUPUYCsXPfI+j+hkgl
         7KDGiWSmxswyegqA+sq9iCcM+pOxcbgs6FeeeIoJOQHJRe4KeqTva7q1Ia3ttAGk5mHn
         mIYEeKxxXRdIlWWq1FpBkFY9hlrLSutctnK5koAFjzrCVzTTfk3KtXr8tv4baFuHdwu2
         CrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926748; x=1725531548;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBIibW6bVR5APpJwyC85Xdt8Tuc8bfpaj1B3BDF3PDE=;
        b=UqXVmtkDjJEOe1Q8U0Iig4lVD2Cm6E4pl0b/ic5ljsY3vNu+qk02nJ7Uo4KXIFcwnH
         Uuyi8K9t08R315DBSSd+gK5/5DgJsbZd9Asxuku1e4wp4RuMjSYDXfSBFATmAvy7R1VD
         pjb+VMzFTmErD2r+x+4gdNbeUvlwmZQaURmfya7eMi/CuycfpM1GFcmEy6xB+TdwsXxI
         FSQdr7GU3UycJfmQ/GHPmG6++YvRrNapmHyWckN2+lDNpFEijt+6hKFtfNFIOv5AccO3
         zWsNNcGUKzNVTmhFU/o8K8EGYUOc0QPsRY0ZCEAC8CODKB7k4/it7s1SdBFbCn83G2aT
         YbCw==
X-Gm-Message-State: AOJu0YygSJQC+/VMdKCKj2EJzWTr8H9GxW4i/A9OfARglLZrmWe2jwgG
	TIVFE95qf136moVC6hjf8+hJtp6lTjWlsm91n3oKdkiS+OnM9fMWSXpbR1NH5Qbxc/RgoOVAn7s
	QprQ=
X-Google-Smtp-Source: AGHT+IGgEmL0pCE8/tlKRnWLgBEzuCQvXlJj4RZp/oPk/TPOC4FsQuA+xorbsQRWsAes3tpUsQPxxA==
X-Received: by 2002:a17:907:7f15:b0:a7a:aa35:408a with SMTP id a640c23a62f3a-a897f83b281mr186114366b.25.1724926747024;
        Thu, 29 Aug 2024 03:19:07 -0700 (PDT)
Received: from meli-email.org (adsl-242.37.6.163.tellas.gr. [37.6.163.242])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefc12sm60077866b.9.2024.08.29.03.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:19:06 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:14:48 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH] Remove message-id from cc list
User-Agent: meli 0.8.7
References: <20240828-remove-invalid-cc-v1-1-b29dbb379b28@bootlin.com>
In-Reply-To: <20240828-remove-invalid-cc-v1-1-b29dbb379b28@bootlin.com>
Message-ID: <iz5zr.xedzg8a7r895@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Wed, 28 Aug 2024 12:39, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>As the algorithm to detect mails to add in CC is very simple, it also
>include the prerequisite-message-id to CC as they look like mails. In
>order to avoid this kind of issue, filter out prerequisite-message-id
>lines.
>
>Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>---
> src/b4/__init__.py | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/src/b4/__init__.py b/src/b4/__init__.py
>index ec230e7ace66..b0d91c0e4017 100644
>--- a/src/b4/__init__.py
>+++ b/src/b4/__init__.py
>@@ -1990,7 +1990,7 @@ class LoreMessage:
> 
>     @staticmethod
>     def find_trailers(body: str, followup: bool = False) -> Tuple[List[LoreTrailer], List[str]]:
>-        ignores = {'phone', 'email'}
>+        ignores = {'phone', 'email', 'prerequisite-message-id'}
>         headers = {'subject', 'date', 'from'}
>         links = {'link', 'buglink', 'closes'}
>         nonperson = links | {'fixes', 'subject', 'date', 'obsoleted-by', 'change-id', 'base-commit'}
>
>---
>base-commit: 99b128995f27cd9aa6fa8adf7588f339919ac14d
>change-id: 20240828-remove-invalid-cc-eecbd7d43b3d
>
>Best regards,
>-- 
>Louis Chauvet <louis.chauvet@bootlin.com>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Tested-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
