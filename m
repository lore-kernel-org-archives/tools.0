Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6758D6106
	for <tools@linux.kernel.org>; Fri, 23 Dec 2022 10:15:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o15so3300446wmr.4
        for <tools@linux.kernel.org>; Fri, 23 Dec 2022 02:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJwl5GBYDdwmaUzvaGX5y9bTVJg1yzEjJtKDaAI48eA=;
        b=FNwqlxYX1pVAkpnnX/WXfRsqCm9FzRGJP5+jUxWNWSK8UqFWhgaH62nYkYfawmDavd
         frLk9xo4gXpEXugjvoEfmHkpFpIhuES1TE68f0p3OBL080HL1Sr///ah/ucVvabdvPR2
         j5s7sHIsbwKbA/u7OVxjM3Y67qu6MZUmg10gOZFVlmkRpIb+R3YP8oYBpP7mFS/mgimg
         LCxpSSPxF80w/UJvH9s2OfyQVizzglwB+hrgLdhtqizWXzrJluKXTLJUHTSMpz5LCexO
         zsKRij6DFatF+D80ci4yLkbDOUyNAjy66iV7MUWZzTbuj1p0D/gE4WL3fMdq6Imu3CzH
         Miwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJwl5GBYDdwmaUzvaGX5y9bTVJg1yzEjJtKDaAI48eA=;
        b=KzKMlT8U/0nH7Ufbd1kl3uR44FV8ZKMfk7cqoXjpQZLNwsemUb06w7f+bxKA4oohEl
         z7Co6KZptZHBS4l9lTgfskPJiGLIRzNf/qINMq+o9Gybspb2st9nfVBn0aDty2ZzqPJK
         RA+5ZcnwepE9E4D+j4aqE/+m2tap7nwtgbcY3Kf/XNAfamJOV/AhKdlrg1ATDn7I0IZZ
         wCYMLLtmxrZHTomw9BJ23dOGuEyt87fv7WPjKS4eJRX861/AsZhIxZXLW78Nszcgmqsv
         2YFG0Mj8nsoM5SEkMJFx3IMUkk5jHpsMTFfBp24QPmg/Q70ooXq0N0UFKjVvmAZIZ8Bm
         3Hsg==
X-Gm-Message-State: AFqh2krOCJINlqVX08C3Nd+ujeIrJ8ZeWHSIxRCb1Pz+HBlQAuONmppB
	VxZgeSwAR2+uuyAthjXdo3z78A==
X-Google-Smtp-Source: AMrXdXusGorHSY9D//EMrcxNdESoGmr17zBaObxjtPW8F0aXa6kZy+PwKHs8Bq42MYeczrL4bPuZeQ==
X-Received: by 2002:a05:600c:4e14:b0:3c6:c6c9:d75e with SMTP id b20-20020a05600c4e1400b003c6c6c9d75emr7687810wmq.0.1671790541253;
        Fri, 23 Dec 2022 02:15:41 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b003d1f2c3e571sm9771982wmq.33.2022.12.23.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 02:15:40 -0800 (PST)
Date: Fri, 23 Dec 2022 11:15:39 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 prep from detached HEAD
Message-ID: <20221223101539.xlacupmglv2dw4oz@blmsp>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

thanks for b4, I am finally trying this after seeing your great blog
post.

Unfortunately it seems that b4 prep is not able to handle not being on a
branch:

	git checkout v6.1
	b4 prep -n up/test -f v6.1
		Not able to get current branch (git symbolic-ref HEAD)
		Not able to get current branch (git symbolic-ref HEAD)
		Not able to get current branch (git symbolic-ref HEAD)
		Not able to get current branch (git symbolic-ref HEAD)
		CRITICAL: fork-point v6.1 is not on the current branch.
		          Switch to the branch you want to use as base and try again.

Also b4 translates my branch name I wanted to use 'up/test' to 'up-test'
is there a reason for that?

Not sure these issues were mentioned before.

Best,
Markus
