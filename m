Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3F2C9C;
	Tue, 18 Jan 2022 18:14:37 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id bp39so22990257qtb.6;
        Tue, 18 Jan 2022 10:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=na+but9kv2yenGgS0UsN+A6QDYRZMgJ9KjysjiVcw64=;
        b=dSRs85g2TSB+ni8wSoHQ7zGqeybAReB1sinUVV1ckp/+W9y2r6UbfNl6oHBkiOcIa/
         Ezw1G2tuYG2x2FMSvIaQ/V695w9+v3a3Jwr6C3PFl7b2vodZvVUbvYUFW/gaVKX44XJ8
         7dLRSWkP1vNuluA6DFoHo8XAZFmjKDW5A65lYUf+jRwMJtls7siluiIKZaLROJjXgcvc
         XOJL/lPDP0JR2Bkw5ER2WWPXY7012N0dhRMQbXp5hlFUojhV24lM/vmyifE3F3iqOkLB
         bRadDwx/UBEhVR7lgSva3cgHgnwwcJfFlrKPIIwA9mKwUUarLvLEZQg2H4NQdqlEBOxX
         DeSA==
X-Gm-Message-State: AOAM533t4YXxwc2rsDUy3sddGl+U5ECqlAzxJCZLCtUypAFFjoo2PnxZ
	85AUxL2JSJ7nZKTm8gVHajU33P0xCNU=
X-Google-Smtp-Source: ABdhPJwQ+Oa8W1GsJbCqxD+4SGKjAMeJwhEiM78bN9CuZxdaMXa7DC0Kb9m9pYxzeyEXdAzpbk0cdQ==
X-Received: by 2002:a05:622a:30c:: with SMTP id q12mr3664611qtw.594.1642529675972;
        Tue, 18 Jan 2022 10:14:35 -0800 (PST)
Received: from dev0025.ash9.facebook.com (fwdproxy-ash-009.fbsv.net. [2a03:2880:20ff:9::face:b00c])
        by smtp.gmail.com with ESMTPSA id bm2sm8746632qkb.4.2022.01.18.10.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:14:35 -0800 (PST)
Date: Tue, 18 Jan 2022 10:14:31 -0800
From: David Vernet <void@manifault.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [PATCH] mbox: Add support for proxied https connections
Message-ID: <20220118181431.fzyciytpgoiruhh5@dev0025.ash9.facebook.com>
References: <20220118174144.2445150-1-void@manifault.com>
 <20220118180006.7slmzgm6jrvfaeeq@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118180006.7slmzgm6jrvfaeeq@meerkat.local>

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote on Tue [2022-Jan-18 13:00:06 -0500]:
> Hmm... I'm not super keen on this addition, because git has a lot more than
> just http.proxy setting and supporting all of it would be a huge pain. Is
> there a reason why simply setting HTTPS_PROXY environment variable is not
> sufficient for your needs?

Understood -- using HTTPS_PROXY works perfectly fine as well. I thought
this could be useful to allow callers to configure their git environment
and forget, but if you're worried about it being a headache to support it
then it's OK with me to drop the patch (it's arguably nothing a bash alias
couldn't solve anyways).

> We already track REQSESSION as a global caching var, so we don't need to
> introduce another global tracking var HTTP_CONFIG (it's not saving us any
> calls to git-config, as we'll already only do it once per b4 invocation).

Good point. Thanks for the review + suggestions. If the preference is to
just use HTTPS_PROXY then we can just consider this patch withdrawn rather
than my sending a v2.

- David
