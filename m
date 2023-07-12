Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7F31F95D
	for <tools@linux.kernel.org>; Wed, 12 Jul 2023 18:09:49 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-635d9e0aa6dso49041936d6.1
        for <tools@linux.kernel.org>; Wed, 12 Jul 2023 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689185388; x=1691777388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g36c91momy/dcAFNY2hzHLu8jPsdKzeFagfxeBNKj9M=;
        b=PXgKzGW8BLrEotPl8EGWVyNbx9s8owLOQaJ4p5G9jpsTsf7fRd+Mk6ku6lYhvGHPhH
         f2flxUsKYdBNO0Ni3hMXLmjB6vv4IYqSVzqlMzBVaZYAByxYEUDFMkkeeSywnpF6X23n
         ci9LnlLZiB9StKQWx54SLfPOSjM2epUNHaYAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185388; x=1691777388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g36c91momy/dcAFNY2hzHLu8jPsdKzeFagfxeBNKj9M=;
        b=T1+KwuN8XQyYoFyEAfb0wMigMZJeLEmNMpoZPc6cNubmE8QhXVp6QM5HqUZIeI1W6D
         URGsqMFJyik+ys/fayR1xfeRqWk1zTvsyIbjfPhNMhFq2YD/c4Xhhy0iB713y5IBE1wO
         oSZaptkuKm+LobmcuKbm/ICf7spfHe2GL4EAvuuTZFrEtOSrOlXbsAwpXw8gVja814Ci
         RrBCu7211UOUyjDgFhN1gUARVakEI2aDNQLQvkE2SGUN0kwmMIx81ZG4F3rUkoqxizL8
         Wi6D446m2dABqznqu2d6KIv3f44bon5u7peDd7IGs5ZyAw3F7CcRGJEViNc10AD9dAEA
         mqNA==
X-Gm-Message-State: ABy/qLa16rgs/aZMF3WFveSo8G/MfTDDrsPO/fPJVuo/WRJ4shHGDMlU
	EA1CyRUIoyBW8R0g409q5EmmvQ==
X-Google-Smtp-Source: APBJJlHvabjM12CBAxkC4ztxj+cjQLV5W2E1X2Lt1Q/RfuHFY5uKTC5HMxplY6b4KKVOKjIrS8y2EA==
X-Received: by 2002:a0c:cb8f:0:b0:636:47a5:4bd1 with SMTP id p15-20020a0ccb8f000000b0063647a54bd1mr16910803qvk.62.1689185388284;
        Wed, 12 Jul 2023 11:09:48 -0700 (PDT)
Received: from meerkat.local ([209.226.106.132])
        by smtp.gmail.com with ESMTPSA id o6-20020a0ccb06000000b0062ff0dd0332sm2375027qvk.38.2023.07.12.11.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 11:09:47 -0700 (PDT)
Date: Wed, 12 Jul 2023 14:09:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, tools@linux.kernel.org
Subject: Re: [PATCH v2 0/4] ASoC: rt5677: Refactor GPIO and use
 device_get_match_data()
Message-ID: <20230712-semifinal-expansive-f9189b@meerkat>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
 <168916242630.46574.7633971537485557226.b4-ty@kernel.org>
 <ZK6xI8l7Vdp35yJG@smile.fi.intel.com>
 <d5cac1ef-1d44-4ab7-a933-b381108b1eaa@sirena.org.uk>
 <ZK7HUTyKB6hoaBtV@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZK7HUTyKB6hoaBtV@smile.fi.intel.com>

On Wed, Jul 12, 2023 at 06:31:29PM +0300, Andy Shevchenko wrote:
> +Cc: Konstantin.
> 
> Konstantin, seems b4 doesn't handle long Subject lines for merge commits
> (PR mode).

Could you give me something more to go on? Was this done with "b4 shazam" or
via some other way?

-K
