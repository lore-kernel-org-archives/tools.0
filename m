Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CD5168
	for <tools@linux.kernel.org>; Wed, 18 Aug 2021 19:48:12 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id t190so4401633qke.7
        for <tools@linux.kernel.org>; Wed, 18 Aug 2021 12:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=APbeLQat4z0ynNa5otLVlgEq7M9zMjUw7KeWRVkcY5U=;
        b=ASuvM5BFZw7oqr1xS6Rmd1rw7lM9GHBsA4RAJ0hkGFK1oYBB5ltcYNFghc8Os8UtTt
         Zuj0aUeVcL5E6tjrZSnsZsrxZNiDT8r9XwW5QC6fk1zr/4PfL8RNU6lzugXaKraIRQJU
         TBJp2MEUhRCF4osCe1HOQDOAP4+t8eM3wMhIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=APbeLQat4z0ynNa5otLVlgEq7M9zMjUw7KeWRVkcY5U=;
        b=l2BBMBZ46PQHZFHq5iS8RYWXPBbMmBHpOn7IDP8QR5ORi8/Io4ZUssvGwE4YMPwV0N
         JWbg/FveRwnvry0AODb4M1rhM22smcDvzX0X8gsRds7AAb8a6lBUbq/1ZWXaHLmvhB9M
         bex1NSPSdFwg5e3A9kna8HBNYkGB+LPZRLuXdTmo72CpKQNwbNInEf3oLC+XOHq8GxIp
         X9YNy/1iEKKK0LkOSE1Cg8YffpZgVViucD3Vn0WzMI9cvjfLFsNDazBJNypUxR+iI26s
         tNfchXAerbcaTjkIOP4CITi4Of1Fnn/de+8BkIapR/LareqYqG2i2P//ENDDkyS/ScGh
         FA/w==
X-Gm-Message-State: AOAM530Keeu//rqzxXGAW7/uXwPoEI8dmBJX4NspyjodjF6eWfa1uNBP
	C42M3LeZd28cr87A2Qdh+wsBOQ==
X-Google-Smtp-Source: ABdhPJyQgDm94qP/Y1qVUmnNvXf74Bg+X32xaMmLJr8j9I2m//6PMQBvAXi53sYESYAO0d/Lb9OOFg==
X-Received: by 2002:ae9:f002:: with SMTP id l2mr11877490qkg.182.1629316091975;
        Wed, 18 Aug 2021 12:48:11 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q184sm434145qkd.35.2021.08.18.12.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 12:48:11 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:48:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210818194809.zyoqio4pepghhb3c@nitro.local>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <CAHmME9qz08XYyrofJOU9TYvgZ2tB39GaaxQrVz1-wiuGRgB6fQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9qz08XYyrofJOU9TYvgZ2tB39GaaxQrVz1-wiuGRgB6fQ@mail.gmail.com>

On Wed, Aug 18, 2021 at 09:09:13PM +0200, Jason A. Donenfeld wrote:
> Planning on having /linux-kernel/ be canonical, with /lkml/
> redirecting to it, for x-lore?

It's not as straightforward as that, unfortunately (it would break existing
mirrors), but we'll now serve the same content from both locations.

-K
