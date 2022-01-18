Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D42C82;
	Tue, 18 Jan 2022 19:42:59 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id q14so23276189qtx.10;
        Tue, 18 Jan 2022 11:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T8Fk9JPvVf/ptUu2kgaIbXTbhvSWNbtOt8xy4PN/Aio=;
        b=O+iZC7C8ZTrNviSUGB1TMprnQ8s/iCF/mrpV19+B1/Yz2Iql2TmFQ9nHImZucL6kmb
         w5x2LT5bFkR1z/5U1QqYqRRFj62yLbpOJxKCnwxe3qnGLc38T5lvDq6BOSAwsHfcs4Lc
         I0PM2B635rGL+4y9TeVeLo9bDljVNlJW7YA3GCz4mwkvR86HPJ8g02QCU/GBOs8DNVFM
         R+Qs7VA1TBFG2eH4XXKoK4JlbzDzNHpIirzhW331u4b0y/9BK5Ra9EMIDLGKQG64XTBA
         xy0x6BDXqP/Ybc8ggHZN7GqDYPeP8ziE69Lg2Ymu5PRb1CeLXRseNl8zi3wEKMPHYttw
         7yvw==
X-Gm-Message-State: AOAM533L521eNa/nRGS2aMtzHJ8sjj4O0xmkxrFrwbubBYZ91FMCWNN8
	2PdLxWJwcy0ARuCmVf1B3fFbq6x+548=
X-Google-Smtp-Source: ABdhPJx/sIo20Hq0gq0XzccfzvAWO7yzxuOQnBoAmtGSIOyZ5StU6bPS3rIu7aIh7oNa2sD4n4pSpg==
X-Received: by 2002:a05:622a:1a0c:: with SMTP id f12mr12512001qtb.118.1642534978086;
        Tue, 18 Jan 2022 11:42:58 -0800 (PST)
Received: from dev0025.ash9.facebook.com (fwdproxy-ash-001.fbsv.net. [2a03:2880:20ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id h6sm4117799qtb.15.2022.01.18.11.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:42:57 -0800 (PST)
Date: Tue, 18 Jan 2022 11:42:56 -0800
From: David Vernet <void@manifault.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [PATCH] mbox: Add support for proxied https connections
Message-ID: <20220118194256.rq6a6epqcklguskz@dev0025.ash9.facebook.com>
References: <20220118174144.2445150-1-void@manifault.com>
 <20220118180006.7slmzgm6jrvfaeeq@meerkat.local>
 <20220118181431.fzyciytpgoiruhh5@dev0025.ash9.facebook.com>
 <20220118182837.6wgyzp3brztqccvk@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118182837.6wgyzp3brztqccvk@meerkat.local>

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote on Tue [2022-Jan-18 13:28:37 -0500]:
> My thinking is that it's best to defer to the way python libraries expect this
> to work and only look at git configuration when actually touching git or when
> looking up things like gpg binary paths. If we implement looking at
> http.proxy, then we'll also need to consider supporting the rest of
> http.proxy* configuration parameters, and that looks daunting.

Ack, that's sensible and I agree with you that the environment variable is
the better approach here.

> Sounds good, but if you want to sent a manpage update to mention HTTP_PROXY
> and HTTPS_PROXY env vars with the link to the python-requests docs, I'll be
> happy to accept that. If you do, don't bother with the rendered manpage
> source, just edit the .rst and I will regenerate the manpage on my end.

Sure thing. I'll add a small 'PROXYING REQUESTS' section directly after the
'CONFIGURATION' section and send it as a separate patch with a link to this
discussion (let me know if you'd prefer it somewhere else). Apologies for
the arguably noisy first patch, and thanks again for the suggestions.
