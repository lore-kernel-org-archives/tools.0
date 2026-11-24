Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551861;
	b=GwvBo1PGMAG3qddQcIRM8VHdZ5GBmk0N4lcvkTMOx7BZFJLdg8DEJkslgVHjgHc8XnmM
	 nssr3QQe9ekjn1mf2WZdLEFtWrGhOMmxjjoLtpcGVK43WI1SpI42T6i2gJKKyUQP2/1Jc
	 z52wX8tbz0gWrSyo5qQkoU/Pwsz6L8vMmKOkjQ21Cavk33lvF6HXrpuQdBwR94EILU6/4
	 nTqWA7P4/1BptsgBgkBTh8lL8zAxobzslhgyB1Ruu52EezIENUa/PDXf5IWxdJ5s7kRFR
	 eb6KBJkdtehoa4z5UPgyGxeqvG66bGFb/eyqjQO+n34hwBk8AlZVrEUPxQ+XBPS7Orw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551861;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FX48zfyZPOCZhy4KNfO6UOI0Lnvkv/Le64+KdKNIBls=;
	b=DoTs7OEimD6tKMdERRVbgm9EWyM2acgic26NamcOFmnBTFZ8tjTD4mhOqoHrHqFX32Gd
	 ELO5t6EKht+gBhwtreOnBdao59mQr0HQYhc/fEKJEbPxBhduKj4Yq165ZELXwxTrdc0hQ
	 zViMABA6UgC9PHS18HgC/q7nLHq2w46/RI/SZu/7tVEzo4OfJCggSylU0pxWg1eN2xzlj
	 C1Jm5qQTM/M8CmfPadXg7k6FRSHgO3SDiTuTUybTB2Pe8zGH80i76n1lsf557PcmSS3dY
	 ure4011BqDsaSHXHou4mH6iXe5SlONftBOxL7N2SmoQmJZclA36KVKraWsS4ntHs0DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uaoayJ+h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99003606A31E
	for <tools@linux.kernel.org>; Tue, 24 Nov 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=uaoayJ+h
Received: by smtp.kernel.org (Postfix)
	id 6A5121F000C6; Tue, 24 Nov 2026 20:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F8F1F000CA;
	Tue, 24 Nov 2026 20:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795551861;
	bh=FX48zfyZPOCZhy4KNfO6UOI0Lnvkv/Le64+KdKNIBls=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=uaoayJ+hSxXUJsxxjN7yy1URdHqjI/1RD5ZPyWHs4ATZaoYFKhL1nUG5pyeISWIUu
	 p1hCmHHtOocoaYgLrmIFPzxTh5eTB/e9rPhjbHXJfV2o2JYZCkvcaTaieKClo6L7bC
	 Ndkm3oPEzUpsQe6UTG1S9cwrdUbNOTYuS/V2GNjQ=
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
Subject: Re: [PATCH] review: Refresh series after manually linking a new
 revision
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <20261014115111.303997-1-broonie@kernel.org>
References: <20261014115111.303997-1-broonie@kernel.org>
Date: Tue, 24 Nov 2026 20:24:16 +0000
Message-Id: <179555185698.2933355.6198302427616229581.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=509;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=jHFNTBGOiHFu4+w/CSCzFnKKQQT04LhRT+c4JjlASmk=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJZPxVHz0znuHhsec83Vhk/qyc11/iLTBat9zqwbe6jb
 P+addW3OkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzE4AjD/+LtX6+GTaq5ZWq6
 82S52bV7K1f+lXfbHJywhLVP1Tigfj3D/+oNn8O4vH7POSKsc+Ctr9OMDVVewe4VE66FccQcnn1
 +JxsA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> When a new revision is manually linked to an existing series by message ID
> the new version is not immediately visible in the UI, you need to do an
> update of the series to cause it to become visible and allow the series to
> be upgraded. Fix this by forcing an immediate update as part of linking the
> series, splitting action_update_one() to separate the UI hook from the
> implementation.

Applied with a few small tweaks. Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
