Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ADD33D4
	for <tools@linux.kernel.org>; Wed, 13 Sep 2023 19:44:46 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c39a4f14bcso1307815ad.3
        for <tools@linux.kernel.org>; Wed, 13 Sep 2023 12:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694634285; x=1695239085; darn=linux.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KF4ha1niiun6OC123soaPjhi7Ad0yZ0eogNH1cZ1DxI=;
        b=MfJDcY9cL+CYEBauC/7OtXtdQwNjM3JFl5mRFdPl99SkxBRYgqVXyUsxTAB3CX7qV6
         kWg8qbAQWNyg1qTR4gNpT5Cquwq0g673+6mGu/nj2MMeEfCzdOxWF0Uq9Kg896lOJfJZ
         pWiWEE5onFI8VGy3x6StVgJYpvG/7rdoiaH9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694634285; x=1695239085;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF4ha1niiun6OC123soaPjhi7Ad0yZ0eogNH1cZ1DxI=;
        b=ek1+/kZ/ZFsLUTwibcVjisr1p10HUXxIF8mJ9rwIhlrgjAGm/SHUmGUEe3FF0W16w/
         KoTFpTOOB3ZpDxHScWHpBpFE/zRsqVqc0fJmWqLbqDIGN5Pjp3zghhiGEoS3kzYfUaHN
         xLwAUWyQ+ab6nlysBKitdD5v0Rrh549urFDgUc0aXDqXfWitjAAAjG3pV59Al9mYbmiy
         imt2+SaOYpEGNn1I8lWjJcx1nZ53th1Ks/2dXJoGfgAz2NGTwuPhBByBf3weBOatF6lO
         fxMIG1wagbDqTN2fuOxMOurZpYAiHHcer7/kSF+GDI/jtXRFd6GrmXJ+4gKNBxJWcDPX
         U/ow==
X-Gm-Message-State: AOJu0Yy7bceHFpBB78bilJrYLqsVBaw0RxfnUM5unkSwSWKayE9K/b8j
	o3UStLqk5SiahJsee1uCOdO9TA+DFimpso1pkyY=
X-Google-Smtp-Source: AGHT+IHL6d7BWHZVqOrQp5pPbhbhvgzo1ZOsFjaQjeweOPNAitXDkHgRGzrwid5R431bUveaHxJGtA==
X-Received: by 2002:a17:902:c403:b0:1c3:f745:1cd5 with SMTP id k3-20020a170902c40300b001c3f7451cd5mr1487235plk.34.1694634285196;
        Wed, 13 Sep 2023 12:44:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g1-20020a170902fe0100b001c0bf60ba5csm10741969plj.272.2023.09.13.12.44.44
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 12:44:44 -0700 (PDT)
Date: Wed, 13 Sep 2023 12:44:43 -0700
From: Kees Cook <keescook@chromium.org>
To: tools@linux.kernel.org
Subject: b4 tag parsing too lax?
Message-ID: <202309131243.5D508355@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I just saw this in commit ef6e1997da63 ("wifi: mac80211: fortify the
spinlock against deadlock by interrupt"):

  Reviewed-by: tag, or it goes automatically?

I tracked it down to:

https://lore.kernel.org/all/074cf5ed-c39d-1c16-12e7-4b14bbe0cac4@alu.unizg.hr/

I can't tell if we should just deal with kind of unfortunate misparsing,
or if b4 should require at least a "@" in the tag? (Though plenty of
tags are just someone's name without an email in the cases where no
email was available...)

-Kees

-- 
Kees Cook
