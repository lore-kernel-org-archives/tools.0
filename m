Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A522FAE
	for <tools@linux.kernel.org>; Wed, 26 May 2021 19:41:19 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id i5so2247903qkf.12
        for <tools@linux.kernel.org>; Wed, 26 May 2021 12:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZmXUdH6ZFeAj7/AA7FfFAQzcVfzPfGUOjnQJy1L8CKQ=;
        b=h6Z1ZE4UxbQrBNIRnePn07QeuXDnlw2cS3GHvfv7dPvwT2q/IuwZT6UvNwqm+5W6ZR
         7TeKvUyRL11UDmmpBAaQAslKLxInMPsSDJDGTn0xFqnyiVOJnHCLcBshYNtizvoBy0yU
         Gbh+guSKvwzjF5n0GDOQ6JPtVIJWGVd5+zOfXq8Rk4t+rQSCO0D3cvNCcT16OrvkCJjC
         076NR1eBPm3i7TqGOmuKRWwRE78phsVwHk6S/4a+jYmtBq9ulGn1PQe9XJLGXTyI0x7g
         hQv6zA8MjLKx7rYrYkK9KCq7WlTXd2W14o2mtvpKsahkDVHoybK1k6iUGumfhRQ8L/tF
         EZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZmXUdH6ZFeAj7/AA7FfFAQzcVfzPfGUOjnQJy1L8CKQ=;
        b=LkHXyaeMjuAUUS1Ar3NXLAxJPzN/XPVkFwp68RF48EGcEDxKdv+A0RBcPezLPKj/6T
         U2763aWdRKvesYpyLTEyWjnIlIn/qR23H6b6i1nxUOgw6ZB9qLgvlAUSnC8KuXNocDw5
         ki05QUO5nXDDuuNGVQQVmsuhV+62BaQEEX/Xy61Hu0K+ZDUfbI/y1rYttLBvxzOPZ4je
         rXD/2PtL6w4NnwQSKgQ2z9/rlr8g0cml8erOb1MSnIMO5meLYKwj33jcKvhekYn5aMkb
         o5HM7+8c7hsgazWCmIGV5ezKnMhVEuqttASUK2HkmrwKDQNxYc/Jczf3+RPNhCbTydqh
         liYQ==
X-Gm-Message-State: AOAM532gcclBitK6jamTP5oaKi9MjMZutxSxBRTKg/AHNMDRjOz0yR3Z
	9kOHjbYQANgmqMwHKHryDvOcfg==
X-Google-Smtp-Source: ABdhPJyvMciOkegPZ7fqpiVVN2zWZBjyPhP8Zvs2o+lunvEA6oIZRiBOsftCAk3lg+mazUVUTfa37w==
X-Received: by 2002:a05:620a:165a:: with SMTP id c26mr43348308qko.259.1622058078651;
        Wed, 26 May 2021 12:41:18 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id h8sm2048716qtp.46.2021.05.26.12.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:41:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1llzP3-00FIT5-99; Wed, 26 May 2021 16:41:17 -0300
Date: Wed, 26 May 2021 16:41:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.7.0 is available
Message-ID: <20210526194117.GF1096940@ziepe.ca>
References: <20210526192558.pex7tuorwqvkzxe3@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526192558.pex7tuorwqvkzxe3@nitro.local>

On Wed, May 26, 2021 at 03:25:58PM -0400, Konstantin Ryabitsev wrote:

> It is very easy to start signing patches with patatt, so I invite everyone to
> test it out. If you are using git-send-email, you can automate the whole thing
> to happen behind the scenes via the sendemail-validate hook:
> https://pypi.org/project/patatt/#getting-started-as-contributor

Any thoughts about connecting this to the patchwork instances?

As I patchwork user I've been wondering if I should be switching to
fetch patches to apply via b4 instead via patchworks - would
appreciate some clarity :)

Jason
