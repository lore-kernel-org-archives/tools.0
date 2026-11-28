Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827972;
	b=a/UHjNxGEFsGb7nWaoSZtUSUuSoCDRP9uIHn2xzoSXWWja80MQy+ZlxFRRdYswWokWp7
	 2+yvWBtJxCP0gMHek3eWUvUywJnT9ex2HAhgyhjiA2uRhuMO83Nl4z+IPNalJz4VvguBR
	 8xPu5auUvUOgmZTRB8ZSepwXfr2mQ7YH1SZs7oNVKKh9My5QCXOWkLwxKvyqYDPFyFVue
	 0Ki4BDQ34ka2IxL+ZXwCQH5nR9Y7Enb5odohgFlUHNoQKrMOsJZchfNhiEicly9VCurVF
	 akK8Z0Cp7z6tYwOd46PQJhdjEmFOB2yEbC/5xBwpaS8jKy/k5jodRPoCuup0+6hj//A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827972;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VP80zv5SrysLv/FaAGozkbwDjMRQqjpsXyUyCoPRoRI=;
	b=zb8C8EWuA1CwFPX3Av/5i15VTmhnVDawA4hs0gRJdxKg/36DhFsewGuaSs/R+pPpmKCy
	 4uJtmGyR2jJzVbrnWiYQPchQXf6PT2UJZ1K9YU2OJAQKjBd+N5dQeDWn3KvrVCqY3VsiB
	 lrohKCUq7G3NfsoDkw07ZK6HC5geaJTpcucjPRA0yyqy8xW7hxncuBufWYKVk3aCCazey
	 x/VqUnwZm7Q2kH4c3cofF3kQTaumM+15XTh6p0pKY9kuppBL5KcX+ohv3WoWxE1Tyc1gJ
	 yAjbwzj6N5eOWFTLShmyXP+d8tQNGgiLw5M+DbxLRe4Aa4N7YitGTBSifcAjVg6amJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ns5fpUcA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69517606A31C
	for <tools@linux.kernel.org>; Sat, 28 Nov 2026 01:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ns5fpUcA
Received: by smtp.kernel.org (Postfix)
	id 0E1B61F00893; Sat, 28 Nov 2026 01:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2031F000C1;
	Sat, 28 Nov 2026 01:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795827972;
	bh=VP80zv5SrysLv/FaAGozkbwDjMRQqjpsXyUyCoPRoRI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ns5fpUcAXZ9TUfRYThP0kVrBbeXGOp34jAKca+JaEVVIupzyIvURdK1x79yhbNqd+
	 FH2INVBweC3J5SpNq9Ki7j2svQSAkpsPYJt4w3VutSLNSuTnNK9si7h2SIbs/uYyzR
	 urI+GUid8R5oOrR9iI2Hh/vGo50tPw1GF1qfVDFs=
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
Subject: Re: [PATCH RESEND b4] shell: copy zshenv and zprofile if it is zsh
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tan Siewert <tan.siewert@9elements.com>
Cc: tools@kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261127-zshenv-v1-1-9e41c65abeec@9elements.com>
References: <20261127-zshenv-v1-1-9e41c65abeec@9elements.com>
Date: Sat, 28 Nov 2026 01:06:06 +0000
Message-Id: <179582796696.1195475.3422428907206642182.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Mx7kBWb5zyfgFwMZCvNT+/5ETLKSKdcFZBID0IWmL6E=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK5NJkM9hQ9TNpp4zx1LoeW4endl1cm1qYePSenMWWO/
 Ye9l7StOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenANzky4wM/zx+8CakaSxd4X7I
 ulNA/IXhZcfK6a9+nAmxf/iNPYb7ICPDSuaZm1eVGV+/8DxtcXbg9Aax/06my0vqVOx9joRp/5/
 MCwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> ZDOTDIR gets overwritten to a temporary directory that has a generated
> zshrc, based on the original file from ZDOTDIR.
> According to zshall(1), zsh also reads .zshenv and .zprofile from ZDOTDIR
> before .zshrc.
> 
> On NixOS / home-manager, a "$ZSH" variable is being set in .zshenv that
> points to the script directory in the Nix store, which is then being
> used by .zshrc. As the previous mentioned files are not being copied,
> the shell is broken:

I had to play with zsh a bit, but I think I got it working with zsh the
way you wanted. Can you please take a look at the latest master and let
me know if it does what you need?

Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
