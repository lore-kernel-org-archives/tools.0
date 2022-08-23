Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1303E7E0
	for <tools@linux.kernel.org>; Tue, 23 Aug 2022 18:45:47 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id y4so11226704qvp.3
        for <tools@linux.kernel.org>; Tue, 23 Aug 2022 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=qyukqnLaSHeNEVa9QReMFTCbyRb1SfXXgUSAO+UOE1o=;
        b=FIkjZY/BWYc1LTbuROqzGGwjsIgteXaFpfIYEeQdiueGLhTknKRJ+y5m2Ude/sd11h
         iLSETsM9FINTRofYzTi7sy/oJWNQC1DQlzZzHB4SxfPdJQDTxq5dL3ikq8HQ4IUG7+Ju
         kGM4BLlFOYinVKkc2ML2JMwQFRg2hua+YeIDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=qyukqnLaSHeNEVa9QReMFTCbyRb1SfXXgUSAO+UOE1o=;
        b=DIXCsCQHsK1uBBk6pSvoCN3bwKwLIBNx4y6kPo5IkEvDBtlrCeBldua/EB5wl66fdJ
         fZi9xne5BNLaREIFPeCPT20VUXyj5NrNM+HFoz+MmVIQtoeD0FijwEFuMMvE0TAe34QJ
         3LNqqJYxRTMnLvaJ52jvfNCs+mX02xuRP+T4sOyrqmASx8driVSf1SkZxkS2LJqfbEE7
         eQkbBj6pFmADob2WusnLU/1UE9Z5x+Ot22a6FG1tAy2Ee4NFRJHrzIMmCC4AAFb1lG5Z
         1VXa0IMeGInxd1kXdaIPaRo0ewCOdl1HViVBUo5EmXE4mk3S/HYBLNqV23h3TpHqditx
         kQJg==
X-Gm-Message-State: ACgBeo3vQaccWODyQyVqAKf7qCmGc6wkB3kCKsXavpmL0GBg937fnTQu
	LDyeqxl79/gBpk2Q0sQtgYnGBRGMfyb5zw==
X-Google-Smtp-Source: AA6agR7jn1/AMkt5Cz7+bcnbc7piofa7P3A94YbxXaQV+5sc6waoswsKHDzv6z82v78TdYYEAEgAeQ==
X-Received: by 2002:ad4:5aa2:0:b0:496:e034:dc4b with SMTP id u2-20020ad45aa2000000b00496e034dc4bmr9874798qvg.43.1661280346865;
        Tue, 23 Aug 2022 11:45:46 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id 11-20020ac8574b000000b003435bb7fe9csm12086222qtx.78.2022.08.23.11.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:45:46 -0700 (PDT)
Date: Tue, 23 Aug 2022 14:45:45 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Morten Linderud <foxboron@archlinux.org>
Cc: tools@linux.kernel.org
Subject: Re: patatt-0.6.0 is available
Message-ID: <20220823184545.lur4jbqfcb6r6diy@meerkat.local>
References: <20220822170226.4amnes5dt7ng42xg@meerkat.local>
 <20220823183543.3735p3hdf7pey4hr@framework>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220823183543.3735p3hdf7pey4hr@framework>

On Tue, Aug 23, 2022 at 08:35:43PM +0200, Morten Linderud wrote:
> Thanks for the new release. I was packaging it up for Arch and I noticed the
> tarball signature on git.kernel.org is missing. Is there going to be a signature
> on the release?

Woops, I missed a step. The tarball and signature should be there shortly.

Thanks for the alert.

-K
