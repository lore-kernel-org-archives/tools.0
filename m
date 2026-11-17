Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956201;
	b=ZhCxAWv9vblate9aGQmngsMqJtFB55TA0YUF5ZCX7iUxMAsHZK2oD55zKrHhNGVPQXq6
	 xW8YTA9EcMKhbElpcLR2VLoKFMJnf4i7FMfN3qQqf6JZO0aRHyu8FpcrU8JRiaTji3KFg
	 gkf6dTeDO8SUVV59N1bmYAuNVF8NFYzNT2GotSpd4OEBiSEKa0gRbt82ctEtZv/abGdIJ
	 bQve9NQngp60d0agGZsj9ZN9ci4rI7jTot1nP0S03b9mP85Dre/UmKNqo4BolptJar/SH
	 4hyj16PXRdbRgiqfs7Fwpg0AGESCynI0bZHcNd88t5lC3vi2iotO0pPOiz5N88dSnZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956201;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AHC/rrVMgzz8Pca3eMdjUrBHJe3h56FD9V0xqnzW0dY=;
	b=MMVFTt+ZllYi90AWu4v59XgWwwxBmqeDa+3ljuOpLDLbd2XAidVOK6BsqB+DJSxFnv+8
	 H62GivyRq/YaXxIaJEaPB1rv85K7Kz7bIHU7UltByOYr+SXgQ7pad1CqsrS9Jg2dL9O5D
	 bg21FqINQ0KUIc1BdRUphuzIWQu9YK/3zZII22Sc1R58UMx71wN/MQLdAse4vVJ7DGvxS
	 iaYgdPN+juM/WeRH3fVipliAtnWr1n4anfNbGOfX8VuRi/flUCmfQEY8AGU7mDgT/eJhS
	 ptCbZGK3h5lPBtADvxtX5kSHTBtpm9xA+Zw6ebSEov1nNbY39WFMzcolXkLjFtTJ0ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Lx4ruyck;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FFC606A31C
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 22:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Lx4ruyck
Received: by smtp.kernel.org (Postfix)
	id 943F11F000C7; Tue, 17 Nov 2026 22:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1801F000C5;
	Tue, 17 Nov 2026 22:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794956200;
	bh=AHC/rrVMgzz8Pca3eMdjUrBHJe3h56FD9V0xqnzW0dY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Lx4ruyck03scG5Z8evtSXqaU0CLE1Oicn6QhiBjGBNMzzjPG0FbXdqNMqdxVVo+QN
	 UtSdL0wAJLfnp83kPSuaTkPsbpZK5KtZKxXpwV9jtIJWmeCoZohXYm7q6PFdrqrFCA
	 wHO53bVeDMMDtjl54dcS/NSF/DKi+kg6lJZqALcs=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] review: Say why a series is snoozed in patch
 listings
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <20261117-why-snooze-v1-1-5a088b24fc42@kernel.org>
References: <20261117-why-snooze-v1-1-5a088b24fc42@kernel.org>
Date: Tue, 17 Nov 2026 22:56:37 +0000
Message-Id: <179495619729.997809.181928077228466662.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=580;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=36JF5TkHaEq1/kNh563PTWeX619SPlEn7/wRShcQnbo=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLL+3F7mrfVR8I2kpFGL/c4jP7rmVvalzwm5+JZ56lfTz
 0d/c6z40FHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAiXw4zMhx5tjB6ikKrmCDn
 ivb/aVHKjAd7qooOfn+hk8DbFLn14SWG/0nxxxMmHuaqnsbK/rzhn+dFh2sCRyYvdt9lN9kz/Ie
 3AxcA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> When a series is snoozed it is listed as such with no further information
> on what it is waiting for. This makes it harder than it needs to be to
> understand why something is waiting, the information is just not available
> via the UI. Add a note to the status saying what the condition that the
> series is waiting for is.

It looked pretty good but I tweaked a couple of things that should
hopefully prevent wrapping problems with some of the date formats. It
should be on the latest master.

Thanks,

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
