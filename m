Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA032560
	for <tools@linux.kernel.org>; Tue, 14 Jun 2022 21:48:24 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id a9so7427530qvt.6
        for <tools@linux.kernel.org>; Tue, 14 Jun 2022 14:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=InPBwsA8tkuadTHGeyBDmB40PTk1tezIG6IOURywnL8=;
        b=eiT+n7+eZj7nVPZNbAef20q7oxFX1VqLD9aAjNjl6SyUeHNPR5vJ7GisU8QviUJGFa
         AO7fEWzglvyKqv+VxMC2PohQT6YuZT3wkANMJBD5NuhKrknsHTQeT5YqrFNMv52mpRbH
         Tae/P+tOuJcJUz1RlTMXmCppgOcET9i4Bi5f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=InPBwsA8tkuadTHGeyBDmB40PTk1tezIG6IOURywnL8=;
        b=e1CPgx4IVDNxQ5A4FbRgeW9TEeOkkdURcHzUC6DOCqC+asheiRZOESQ88O9rSvdpc7
         3lli1L0nfVl7bHfMDJ45mW49EsjhWU5P3lMGfUYEncHPbBHad36iYaQznDXw+ZPTzmzq
         zkQobLeuIR9X+w6TRqpJyta46O1aZxLwo6U5XK6X4tzcG+RBDr73VJganO1PbiYMBdXQ
         ZZTpevAysAI64d6O7HLlUYkt3cd9kc1gFS9XshoWLwBoPIUGZsSd/RCLS3cCAJgh9suJ
         50KXhJIpXJAUYTlnSHXU4J6esTCm7rATm1SBnz8VYCMk5eMKIt7aKe7Xjv24zSV9omQv
         6Ywg==
X-Gm-Message-State: AJIora/j1JtS7tR0T9cTvUQivraX7w2R3FSEX2rdMPd1khRKZLmRpCM+
	8kSAx5he4kz/a+vrKfXB3V4ppQ==
X-Google-Smtp-Source: AGRyM1tqhL84aK4aSxIio4d7ei82uNDch6QzjJzTMoOSIjXltcR3P44w9y3Y6/WRW+g64HmsOY75eQ==
X-Received: by 2002:ad4:5fcd:0:b0:46a:a0f8:db51 with SMTP id jq13-20020ad45fcd000000b0046aa0f8db51mr5563900qvb.11.1655243303708;
        Tue, 14 Jun 2022 14:48:23 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id m6-20020ac85b06000000b00304defdb1b3sm8479872qtw.85.2022.06.14.14.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 14:48:23 -0700 (PDT)
Date: Tue, 14 Jun 2022 17:48:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 Link: trailer disambiguation poll
Message-ID: <20220614214821.efd3f54cj6fk525g@meerkat.local>
References: <20220614213955.eyex4bekp44iroud@meerkat.local>
 <CAHmME9phFaM25WqgwNj7OofWn5sJfGLvzroThEp6hH2KgBFYPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9phFaM25WqgwNj7OofWn5sJfGLvzroThEp6hH2KgBFYPw@mail.gmail.com>

On Tue, Jun 14, 2022 at 11:44:07PM +0200, Jason A. Donenfeld wrote:
> The option I don't see in the poll just not automatically adding any Link
> trailer, and leaving that up to humans to decide a relevant link exists vs
> not.

That is accomplished by not passing the -l switch to "b4 am", so it's already
a choice left to the human.

However, tying commits to their exact list message is extremely useful for a
lot of automation -- e.g. I rely on them heavily in integrations such as
patchwork. I don't want to discourage people from adding these links in.

-K
