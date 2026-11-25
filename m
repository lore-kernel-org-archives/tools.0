Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620412;
	b=lZhBjfJoWHkprnJmgvVNDK/e3OzVRgRLZreTvTIu5hXBLgqq/oI+codhdi3jf9Fg11wu
	 USePvXOdqDYy7E0j2nTNtaSmkw6QGrLHVnGousl7Toy4bJnkbBWk7ftUk2I6XSdBoIJwx
	 AtFkTb+1s4PFumvBPsYRWPbD817DvJaotSvUsPHUE2I4iaN7s+jmY0kQv4joJIKTwm+F9
	 HakR+jYRo/7ROG1WyPAeRy6RXZ2ESXR4MCIq2g6WORYsi1+TRqY8qV2Ii4M9QesYHuDkB
	 Xm7JtDiJY1epBqsvZLe2Iye13XqWLSNrRt8vC0RLEZOlWDXcix8MjMTYu3Lgwx13iZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620412;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=QwRz3Jo9srPIHzf1kMVcrHTF7XSBXEDtwnejr+kVoNc=;
	b=yDu93AIEYky2zwGSZFhzI4UXvjqe4A+YuTf9XL/3N953RUaYx2bcD0CQ7xedHVrTG9H2
	 KxckYJkoDt3LQIUEPqojJbGS3Qj8o9o4Y9XPd65JKEeKcgnTbKTtLTDss35cH+vu13VV1
	 JxO8DnjftV87WvY29F5ZodwFI97gsAqeOyszhEoPfy7jLl0kTzP0SrkJe/g39pB0qTTl1
	 YVgOwXM5CxB0+ZTYGgDPEa+czi2vq1fzaauZEHq8zfyoyeexN5IoqmI+pO3HqFJ0vl0ql
	 4EFZkVH3JyAAB7vaXZfIrv4bytBwLPYEWIYoBLP0r/2H4sOi3nG44J9vl3b/k5gH/sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X1kJrYk2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051DC606A32A
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X1kJrYk2
Received: by smtp.kernel.org (Postfix)
	id ADC7B1F000C6; Wed, 25 Nov 2026 15:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4951F000C0;
	Wed, 25 Nov 2026 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795620411;
	bh=QwRz3Jo9srPIHzf1kMVcrHTF7XSBXEDtwnejr+kVoNc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=X1kJrYk2N6PoiwY/vBKlAB019OWdr1KtmOAC8LYql1/rmkf3apWVWO7gB+0o77xGp
	 frNkWnS9yA2IzAsFHyosD39p8phAmHALiu7jUzfUOh/6cCwkA2xgkBeIiCUQrQvedR
	 +pcB89L9dJBEeWBEew5GmgfLbSaLttanKcPGCdXM=
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
Subject: Re: [PATCH b4 0/2] review: tui: Make series level reviews visible
 with no cover letter
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <20261111-notes-no-cover-v1-0-b9b0d883742b@kernel.org>
References: <20261111-notes-no-cover-v1-0-b9b0d883742b@kernel.org>
Date: Wed, 25 Nov 2026 15:26:45 +0000
Message-Id: <179562040521.198045.3180012341833344677.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=455;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=u6SzWRwFtsob9xWnScTYWqnNED2fwIlco2XqsobL3i0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZ/pmZPxb4ndJYPatonvyvV6/OMIq/O83uEsrz9UfE4
 7s7TYrFOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzkfBfD//Sdc2QSFu8MnnNv
 W/0qx9j3t35/jtOdzG9seUayxSLf/TbDP5Vf3dHXT4QGtDFucF90K8tzl5V1wV7FEn8nP2GTloW
 7uAE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Currently b4 only displays series level notes (such as generated agent
> reviews) if there is a cover letter which means they are hidden for
> single patches or any multi-patch serieses which lack a cover letter.
> Fix this by showing them alongside the per-patch stuff.

This is now applied with a few tweaks. I also pulled in your series that
fixes the n/N doc mismatch.

Thanks,

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
