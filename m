Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792430944;
	b=XvTXx88e+rSoCc3xqFWSlj+xEOpq3vV895K9gQvjXgwBTTomQ2PdGn+kIEhy1p/nTxVm
	 gJ3/+IjKBWicVUvxi5FXGF9aZR4mkehVBi0q4Q/ILjZwp3yFgSQDSognBwL162cXHwpGS
	 JGwkI/Bsh32bx9HwjkPTQFSMaVAReNdoVSUrTsbbj/J79IvYOqKu/6QeGUcVL3JU0pI+v
	 JasnFbwjShmZ8gbL+lpP0FmjaoU5avU1nThJvH3pZybpeA1O3+HmHTjoQ+f7C4kVwwoFn
	 85o1maml7J563VGC6wpu6JtaMZmqXHvUhu9N1d/FBEp/PRQuMfWRy9hgj7/TTBRtfnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430944;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SLzTFm5FwBqQoSxlDRKPjATQ3+VUfcoMTka+6oIj/mM=;
	b=zuN0kA+H+6GOT109RN8yxai1gKfoW1TvFsQCqOohNOVdG0tQVZKHIah+85DhKNfohUHI
	 nLPkc2e6PUGoID70wQX3zZuFcCuJKUopGW93JUimFcvYv1Hr0RihHTeHmvxl6M4t+391p
	 pH+n6hLu4YGsRgHFMvkWYO1o3IXAbRYMDOrxmJZoof27tBBbiZSZrl9Uj3ySrExoWSCEz
	 NAjLe58Mfo/HjbO/Mu+IWYMPyqu87CfL4TizURmW+raCcKRAUFIUgdoC3XYf/LxGqIJwN
	 YBetca86+BhF76irCpwIFoa9haowQ3HDwFrF8z4wQ2BekIw8dzcmb+UXspKfBgGjBWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HjNnR00Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6732606A324
	for <tools@linux.kernel.org>; Mon, 19 Oct 2026 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HjNnR00Z
Received: by smtp.kernel.org (Postfix)
	id 49B9D1F000C5; Mon, 19 Oct 2026 17:29:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792430943;
	b=xaogv/miaiN5HJY4VOo6ZhYiVkLwB59qz0RsbzHq5GAerHjknDnQhNH7FujJdur43WyW
	 fuC4AQ6aCJBNL/eTGtKd1d57uXaqdwXcCewjoR+ncjT5KUVxfNb/uAEs5IVjXTJTllNvK
	 O1ftuuTe4SQLODZHmpFechSVdD53FTAMFO0q2jLOcQ2gHH/AhBJl5n/TluXoaKpCXoEtK
	 kBRQxmilUNuUSVeWbHi6+SKjQkpIg7ULe31CapUBZ1V4Pd0D5c22VKi+uBJ3Ea2jJV2Ss
	 my4sm/3iwRK0bca3JH0lGdUYIV4pOhEJ365o425hYPYPXImYPD5IWBC6VEMzpsnL+gw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SLzTFm5FwBqQoSxlDRKPjATQ3+VUfcoMTka+6oIj/mM=;
	b=rlyGbpItbs6/eX2Sv/2U9UqIWwb8vBvuovcjF+NyCjXmrzeipipnehKUf4/WK3JXnHy6
	 L8d7ZCmOVT9asyd/MSZ7ZIdp391+WKkDEjW+DfuGtQBciaGIiiSIMur+5x4hTyO+swVdr
	 pIeSLbIGmOGhgLvvMLEa9CZs7VNnY2lrbg3zbbIhdryh1T6nRkd1i6OiXp2AlznRP/EGQ
	 2FkG+yVNWUCzPGu2JUmo/9ukNjl59ZUN4UIkCGSSCUpe5uIvupSxOmlJLpSgqUZVZ4Jmx
	 MhzfN6e5GJG/2LHx3vMb3hOR3fr/RcdubSxgeqCCJmzaxmrOGfNcVrUR8psqX+54Lig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HjNnR00Z;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CAD31F000C4
	for <tools@kernel.org>; Mon, 19 Oct 2026 17:29:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HjNnR00Z
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6CAD31F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso4539010eec.0
        for <tools@kernel.org>; Mon, 19 Oct 2026 10:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792430941; x=1793035741; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLzTFm5FwBqQoSxlDRKPjATQ3+VUfcoMTka+6oIj/mM=;
        b=HjNnR00ZYMQoCK+F0X0tL5TsNQw/l5TwUSXtNld/zYR1ICickePwHZ5rAD8f8la0RY
         vyeAzI1W0caXjbnBaM+OJYkmNs/vyCM0ZEtIHlWl6z6U1Y3CbDAjARakCueas10+M5BT
         tZeeXIVLGkbGmiTeh3b4BMt9xWKZHZKmHXkuV6/BBV/Uiqway8Ox/GLnBxuWi0DqCRNu
         +jOSQYpEhfHFwcoGiyYq2M+Lrdk1BqRMsPIHgAKJhyBrJWyJWrPQUAwOz02AjuOrBET6
         8wcgwjhZw5iA/TPWwtUU5SLDJFP13yKmB+W4XZdUR3wMYE/93HcHKotsuC04S3aWmUKM
         gIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430941; x=1793035741;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLzTFm5FwBqQoSxlDRKPjATQ3+VUfcoMTka+6oIj/mM=;
        b=g5CYxzWBz7LjWqNjH3BMU7u5roX3ZS6WHj+LitmEmCtEsHBLJkTkNGNmfsuRkOjg3P
         taS8RxHku/8VkdU5h57Hh2R2p1p2TZbRgAS0g7XrwX1cFe1NBVv/4IWwnC1UD6xdrh6u
         uW9Z49zJjQopdLy4D27D9CeHQpJePz5fmvk73Xn+E6ClzENeBR3Ke9IuhL1lVALP7muD
         aGYE5xc4d2RXVQkGcliQDFC0sVcYZu3YJ2jqVkrnkdkQ2trvRmQ9dHIsV8L+nJP6DjDR
         wVHX60lIXaRUZJmD3utfPYJLW7fC2knrdp6zop2ZJksNolLo3zkDs+T2qs1FVQ6fH3B6
         H7cw==
X-Gm-Message-State: AFq9FYJY/DpTVRgqLxmaQjEFE+5bWkQI+dPC609IcZKr7sVujeuMP4ZE
	Gcs9NSd+tPkuMjfgNCrejs8s5YNVrvPeYyQ5LrxT+X9tzsnGLOPbb+Zn
X-Gm-Gg: AYBFou0qSN8Qedgp+Yks4YbSRKE9Sc70NAvy9Un+Ft9exI4hc4c0VhzF/8zbo/4s7Di
	QqpLhYbZQ0PwzCepKltk1IrA9E1an+n9+R9crqvGEfJf9VplKL/8M7Cy7YN4hiovMjG5H360qq7
	21yQWytyULnSFYDyDJZLIVlfPcKoSUNreZPT5O0C/dkWnzMFujRhyKPT3igy8f//iKPs+mmVy1M
	UiP7plhr2wYLHiv7LZGvQE4NxSKHnSdZ9MX3MGQexCrrUDD9rPu5tDt4C1DuwS66ThAAsBjOMb+
	MW5uxH+OfmtUkSnUtwTWyqyYV0T2xr/7avWYlYKs0ILcTrNbhf0Njhf7DuIJZ7p4b4AFw6icXSF
	4OstCGJ2vIvD9c07KtbbQZZHN2IjYmcjEfjHgY1PEy/WL0zo26lzzQJz6uZ0o5BNTsEHK6WrFbK
	PMwqEd9xdfQEn21VWzq6ZUDjAgAO7aR5hP+rYbNb1mYIAOCpNE8uMJt1Ut1Knli5uc9acKjwu7S
	NClfGgAygC4dCUf9Rl37OvCNo/+3OnMvdOkqG7p+y0Fl3YZhkM=
X-Received: by 2002:a05:7300:42d7:b0:365:9e3c:4ab2 with SMTP id 5a478bee46e88-3659e3c6d4emr1060998eec.41.1792430941345;
        Mon, 19 Oct 2026 10:29:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:13c6:2555:87ee:fe93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm32288450eec.29.2026.10.19.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:28:59 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:28:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH b4 0/3] review: add support for b4.pw-key-command
Message-ID: <atZSkl1BseYzIHtM@google.com>
References: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-pw-key-command-v1-0-6daa9b8cee2a@kernel.org>

On Thu, Oct 15, 2026 at 10:08:40AM -0400, Brian Masney wrote:
> Currently the patchwork token needs to be stored plaintext in your git
> configuration. This series adds support for b4.pw-key-command so that
> the token can be stored in a password manager.

I wonder if this should be done through "git credential", the same way
smtp password is handled.

Thanks.

-- 
Dmitry
