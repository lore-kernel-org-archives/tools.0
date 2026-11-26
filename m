Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664130;
	b=qACnfuwBE6ADGmhjFx7KR8MeLF6ez+F/UUBkSThoIiv3x/F01IzsrEHJJH6LnhZ0Riqu
	 /20D5IxBvkG26icquNbiPEjEno10/havSOUFt/Eg/CN7oZfpam2zthfcBo58nggIPB24E
	 QPIvl1rYfX2fMYNgxR5E1EvPYYLuNmNVraB1suek6Xrhb4a67nOcWuFtAa06fqMAW4H4u
	 mILBcBI5J6QyJE63Z1NfaPawOxP2k9M820MQn+GJpAUR5YWb1xXL66m0i0gNRN/DV9NZs
	 8skyR0bhfBjJreLdzkvixYm6O7+Ein+/Mg64t8tKe8JOg1QOPyvmoZCQB0C4OhPs1Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664130;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=q/Vv0dewrDLsewa6UnutH2vKTY5dX+SIRmhY0iW1k7c=;
	b=FjfZiSLpS1hR/W/pWyzp9thCUxjHk2hmzxYPxbYa7MHWbK6M2nijvoYDdM8QCpIGN3mc
	 QB1SW1ggcrJ2167ZFBUE0x4f87G4lvtDsftr2++AByijcn0xsFgdQZbn6AMHXsxiAFJP1
	 lEwJl+GT1g+xtrFkmsuOJYE+rxgWIRoGefF3gXjmbpba0yXPoWxqUZ94/+wknTjC2c9qT
	 X/hRWcN/H9r9nCeEpx60FefSIDsEPcl3nOce3+UTmbmLPVd/d+QxDUU/KiJ7ydAy+zyPN
	 rbaQnedwvsJqpVgRU72F+jYFPYPxxgnn8Ix0PbuN3TygbdhQFW4oWgoq1IKt6YHh8bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YmjTB4RD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C5F606A32C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 03:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YmjTB4RD
Received: by smtp.kernel.org (Postfix)
	id D9D361F000D3; Thu, 26 Nov 2026 03:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068931F000D0;
	Thu, 26 Nov 2026 03:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795664129;
	bh=q/Vv0dewrDLsewa6UnutH2vKTY5dX+SIRmhY0iW1k7c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YmjTB4RDJBoQi0e5mg3T6IrIqRJeJWL12JlT5CVF3cauwAjp6EyLaDbfBD0EfpF4w
	 Kk1GcWEWm+M3mv4VP1HoW/Eroyc6f1E7imPHBZxdvj5tfkK3NPDmNaDKy8qZuYWCEn
	 slLlxcs0XEtHOubIO6enVqbqdXsqrSuDa8jIwFNs=
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
Subject: Re: [PATCH b4] tests: disable signing key in tests
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brian Masney <masneyb@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261116-gpg-yubikey-tests-v1-1-a4513b3bf40d@kernel.org>
References: <20261116-gpg-yubikey-tests-v1-1-a4513b3bf40d@kernel.org>
Date: Thu, 26 Nov 2026 03:35:26 +0000
Message-Id: <179566412650.1145923.3100288408865924430.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=402;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=gXGSasYympxpgLEy0RWJEIrwVmciP+ss7N8pavy2tVU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZV/yfdbBSvFw+T+nb9uy3Fjbzj326enDTG87/EUz9A
 ZkfZnoldZSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZgIwxWG/+XFf9TcNrI3WjCr
 G08TXjbp2K8LkSeZerUZXnp2/hdLYmBkWJZX7Sl6pLmkPPVRqNj8ljczjfn35bx+vHPXZ/fZtr9
 esAMA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> When the user has commit signing enabled in their .gitconfig with a
> Yubikey, the unit tests will stall while it waits for the user to
> press the button on the Yubikey. Let's go ahead and just disable the
> signing in the tests.

I coincidentally merged a broader fix that addresses the same problem
just a few days ago. Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
