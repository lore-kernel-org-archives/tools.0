Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFBAED9
	for <tools@linux.kernel.org>; Tue, 20 Sep 2022 14:48:58 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id o7so1744788qkj.10
        for <tools@linux.kernel.org>; Tue, 20 Sep 2022 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=xcdZ/bLAvkjzgN4YicqBK5lSJsYzpEggKAAaMW7Ysjk=;
        b=WpAXQJhj75vYC3dJRbJLYs0eIcDaigevLldetYBZBy8HH5BCi0q3PlJdKJ9NXyMByX
         08SiN9SFSeT51BpDbxFevpcZjLMtKvmCrPBtgF+W3SbfjlZ3Qfl7ccpGJmT7y4hHijbJ
         PK/AsZ9nuX62LpqPXVJqkG4jAtiaG951oyoEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=xcdZ/bLAvkjzgN4YicqBK5lSJsYzpEggKAAaMW7Ysjk=;
        b=KrBLdNj2nGKdvBD5YYBf9+p2AXqGq7O2MheT0WPa7CUV5DoIuznx2eCYuv2MdsB0zV
         iGPN//YOuglXhsK4l/EjMjII28mS1YZqXWT/x+vjCm53wlNI0hiVwWk5oKP8ThX1ZQDc
         ieWt+7gq3EiTxj5AewMWwyN06QHncfCaBILT49D4jtSaxjHC2NkNTW3E4trYB/6RA0IR
         pnALsweAdLLBdzaqVV7nr3dTHKstyZVST9PQr47ZKnXo/soTVCY1x1DieaZtGysQXqa9
         1cwRwFxDOM21o3fV91cnSgo/sIOamhYA7ZejoH/5vCtvgpAprioDy7YW8+2ICySCxLc2
         1QNQ==
X-Gm-Message-State: ACrzQf2M7SXAHR9AUjYruJq4iBOwJS/vhSvCMXs0R4rICOw2FiwhMQlx
	fhW5fqwU47FDNj2wcIf2/EWOkg==
X-Google-Smtp-Source: AMsMyM4ofyi49jF+uFa00/sIHw2MKYqg96D2WqPKOewOdKiUCISeSW6g8UT/GL9NRjqVimysJ5o6Xw==
X-Received: by 2002:a05:620a:1727:b0:6ce:9b88:92aa with SMTP id az39-20020a05620a172700b006ce9b8892aamr16319067qkb.160.1663685337442;
        Tue, 20 Sep 2022 07:48:57 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id q17-20020a05622a04d100b0034035e73be0sm127573qtx.4.2022.09.20.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:48:57 -0700 (PDT)
Date: Tue, 20 Sep 2022 10:48:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 v0.10.0 is available
Message-ID: <20220920144855.bxe4qtmibbu472rh@meerkat.local>
References: <20220916181319.okfskienqh6kfeor@meerkat.local>
 <YymDlmJG8fNhvHSY@unreal>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YymDlmJG8fNhvHSY@unreal>

On Tue, Sep 20, 2022 at 12:10:46PM +0300, Leon Romanovsky wrote:
> Hi,
> 
> I got the following splat when tried ty functionality:

Thank you, that's due to the new feature that supports sendmail wrappers,
which is not something I tested with "ty". There's a fix in the latest
master/stable-0.10.y

-K
