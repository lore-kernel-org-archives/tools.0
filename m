Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CAF192D94
	for <tools@linux.kernel.org>; Fri, 30 Aug 2024 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725033932; cv=none; b=P8fq19y6BiP5HjSW/DCB7F1Av8MKcoGyBiAslxu6RvHcjoS7auFRrnJZOTMf/ynCVzM1P9NPkojonYUxQVGcZ1GDmG3tgUkt+au0gfz3iKeCxcFrcnoN4x6Vo46YzCy5LZPdVPT2qW93C8zq+G75d3hhtKV/da6JiTmHVZbrT1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725033932; c=relaxed/simple;
	bh=sGFkOooAOaux0yidG64mJl3NbCnOAtnXsryH+S403DM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xfv+7jotdSGpyIw+rtq9km7gUJh9Zt/dxDVhli/oigdHM/dUtePkN4OCFUR1dcmE6P8OtDxrF98V6WRcFLqg4dSTfE58rkIcnB6itfHDYqTEAY/XZqIw5iYupCU0rlwsXOjUgTSyohtdW+3nG59jAPoQ4DsCujKBe2FDYZm0l1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bHIViuwu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bHIViuwu"
Received: by smtp.kernel.org (Postfix)
	id 09356C4CEC5; Fri, 30 Aug 2024 16:05:32 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02611C4CEC2
	for <tools@kernel.org>; Fri, 30 Aug 2024 16:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02611C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7140ff4b1e9so1739972b3a.3
        for <tools@kernel.org>; Fri, 30 Aug 2024 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725033929; x=1725638729; darn=kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+40yxkurJGcNNAZ0Gu+OPkqCJIx/0a8i1cdDwJV0S78=;
        b=bHIViuwuMn6QV3t8o6ET/lM7LYAprV5fzByqAID7AHdv4IdarThhrgrWC5yxxj5M6U
         wIU0eBgQIeyr296TUuh6hedKv9wmidrTiy8ZgaF5BnF3wygjSHOgwZlIHEuYFnAC+zBr
         cDC5cMs54fDMiIRb2m+DQHHwQDhXHwDPTLKlcM4RoI8UC+U40vVuy3XFbPllygp21gDS
         W/VNIBr08rwl15uDlR+uiXXJZDFuR03lEibOBx3wC1KsOsBz9M2JbbtGDntcYUTeLyoO
         f6f13213y5wCzAosPrBN5f4LOPgxNGnID7j4EO6TyBzRVrgeULbtOU81GekCEPqyURDS
         Q/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725033929; x=1725638729;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+40yxkurJGcNNAZ0Gu+OPkqCJIx/0a8i1cdDwJV0S78=;
        b=pLaGDJ8tlJBvibiUXIkhX4LGvnkd1D0BhQgTZ/3e4vbh8sVyvT3BHtD0jLcV9KT0Vj
         9k+2q/MGhfai4C57zdT0AK6KUx2okcvL9M4dq7oZKXSEpkIhCN2bQiNxiWsA/onL6Znm
         /Z91aR/JRnMxAhoH57F9K/UFBSPeHS6spIFoKP94VnqG9RCDtoxGYx8D7Z6YhPqETriq
         KP/cEYnr72vFySpvLoahwcGhZUggr8L3nm7hee1mjXAP3GtrCLYdhAjtVY91yMIEV7sm
         R1lpDd8klxB13c1U6FABRajyImDKrEF1PlL+Tt67+xH+csRrXv+Iza2GNYeKzOajKQNj
         Cx+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0c5vuOnBoYV8OswRNDIOBihjZ91AtMS18CxWRzPunVJaaGOCFFGgBtskJSU2cq9HbLjk8Ig==@kernel.org
X-Gm-Message-State: AOJu0YylSn9OzifAyACf+g8v4Q58dIX5nvmv+LuyKsRFe4WjhO7eiYGh
	WKcSNjqOcgInhFN/yZBYiZiuPoPaN7VHk1ekzcuVsBeNtj/w0h6H52R4f/kQBJSGVt+zUitx6QO
	H
X-Google-Smtp-Source: AGHT+IEzefuH8RFTQNItCcNL+jqKHqPQvY/oEYh5OYK1sNWuJhV88pqM0dwLRWJHVy/qzXPrjJ6h8A==
X-Received: by 2002:a05:6a00:4fc3:b0:70d:11d9:8a3c with SMTP id d2e1a72fcca58-715dfcc0452mr8588235b3a.26.1725033929073;
        Fri, 30 Aug 2024 09:05:29 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e74273dsm2728543a12.13.2024.08.30.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 09:05:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, "Kernel.org Tools"
 <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH b4] Remove message-id from cc list
In-Reply-To: <20240828-remove-invalid-cc-v1-1-b29dbb379b28@bootlin.com>
References: <20240828-remove-invalid-cc-v1-1-b29dbb379b28@bootlin.com>
Date: Fri, 30 Aug 2024 09:05:28 -0700
Message-ID: <7hmskuvvw7.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Louis Chauvet <louis.chauvet@bootlin.com> writes:

> As the algorithm to detect mails to add in CC is very simple, it also
> include the prerequisite-message-id to CC as they look like mails. In
> order to avoid this kind of issue, filter out prerequisite-message-id
> lines.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  src/b4/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index ec230e7ace66..b0d91c0e4017 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -1990,7 +1990,7 @@ class LoreMessage:
>  
>      @staticmethod
>      def find_trailers(body: str, followup: bool = False) -> Tuple[List[LoreTrailer], List[str]]:
> -        ignores = {'phone', 'email'}
> +        ignores = {'phone', 'email', 'prerequisite-message-id'}
>          headers = {'subject', 'date', 'from'}
>          links = {'link', 'buglink', 'closes'}
>          nonperson = links | {'fixes', 'subject', 'date', 'obsoleted-by', 'change-id', 'base-commit'}
>
> ---
> base-commit: 99b128995f27cd9aa6fa8adf7588f339919ac14d
> change-id: 20240828-remove-invalid-cc-eecbd7d43b3d

I have not been able to test (yet), but I'm guessing this should fix this
bug[1] I reported a couple weeks ago.

Thanks for the fix!

Kevin

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219138
