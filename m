Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD92C80
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 17:42:00 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id x12so6754176qkf.9
        for <tools@linux.kernel.org>; Thu, 07 Oct 2021 10:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FRSpKmWTaYrIH2/7XosO6XmpHBrt+awSTeXt1iCtx+E=;
        b=VezWrOxnwe2o9Zlpe5wVmlUdMd9nATn6IiuEuIyEjfA+3diULyupJlLxbU7yzOJlSI
         7wLXlmGxPs8foKmGR8tzIRDYt77I7xM2i1HmyQkIGYkSlypFQFTaTQMjJ+zQuj/uPn/N
         1z4otExafNJC8NaFrsI3EVqCpPKUi5O/TLN/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FRSpKmWTaYrIH2/7XosO6XmpHBrt+awSTeXt1iCtx+E=;
        b=g6LLI1FQrm9asMq2pBydyZJQdf1eG86WIVcQZ+sCWrtftygjI/WJwx017ZGAtS4TJF
         4pN4SUozSY0V2S/7mvVJ17yza3emVM11YtQqZ8OfXZySmIPMVGJ3LboDRhCvOIyGwuBU
         ZScBLoNwHN85EZPJ0ld80mbU+CJCXuCjEHVgYglMRSOiyo3CSghkfHIziB9T3l/TEZhU
         pDcVhVXC7fpJD5j34ageYp6xqoUbPgjXtV/4QkrqYu8WLsDy01zXhYTW9Y6UstkBOwZN
         Q2gGinXoWeqS9Dnz6xmqrr0CTFOh9utNE98S2WVVZj8nRTalCMpdXprUAQK4GttDSsxb
         G7tg==
X-Gm-Message-State: AOAM533CtiWkjxbJHXO8MCTqAFXx4mMJ/X/6X2Zacn9gnJhj4Tug72tq
	T7zGL8VZvG1gZ46P/OZnwIyRHg==
X-Google-Smtp-Source: ABdhPJw0FIWLTOH/SfUzmYaAIFxdXQU8cpiB0/3TawyW5s551qr614uKCk9PUgwsSgbGS7H2QEGJMw==
X-Received: by 2002:a37:65d6:: with SMTP id z205mr4581824qkb.522.1633628519794;
        Thu, 07 Oct 2021 10:41:59 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id e17sm20927qty.28.2021.10.07.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:41:59 -0700 (PDT)
Date: Thu, 7 Oct 2021 13:41:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] validate: Use patatt's configured keyring as fallback
Message-ID: <163362850160.581076.8811630052019728688.b4-ty@linuxfoundation.org>
References: <20211007165551.2312946-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211007165551.2312946-1-keescook@chromium.org>

On Thu, 7 Oct 2021 09:55:51 -0700, Kees Cook wrote:
> If b4 doesn't have an explicit keyringsrc configured, attempt to fetch
> it from patatt configuration instead. This avoids some very confusing
> situations where patatt would validate and b4 would reject. (I had an
> expired pubkey in my gpg default keyring, but the same pubkey had an
> updated expiration date in patatt's keyring.)
> 
> 
> [...]

Applied, thanks!

[1/1] validate: Use patatt's configured keyring as fallback
      commit: 3847a92a365a96270ab0de6111f349e98379f930

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
