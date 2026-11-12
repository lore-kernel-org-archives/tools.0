Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794512195;
	b=r5WYgRCB/FfZqtEjinZXMkKFUk1GElvTM8XqBgOSGvjV5xhxmlL+U9eF4EU/ERn6Xv5u
	 bEnjYdx7/6Al1uJgrB3uU96XWFico6N/sS+3Z2fNG7hEjo8nwcp1okN2V4Y9u7vqMnOIS
	 TaYou/z4Bcsszz345iqEik2176z51lVW5Knpzc+JowFnhLLX9KkVz0c9YgZUYNhInhPvb
	 39l5o9sbv76NMZ2wzSHzaUn0MpyV5hBVkj7F3N8RjwEn+4gJZUvHRAF/sbsZIUYO4ISLD
	 M3LZUMA1IKBm3rjG8FUlksIgP+8t4NiPFy9eslEjOhro5QGz6oAOOlx1EsWvWJSkomQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512195;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ew8S01e+Nzv/5iFYJj5QK/Jyqv5MbII/i0GQINqhdPM=;
	b=Ett6G5idd5vRRg8p2Xl84NG3/oq78Bp2z59QMfXSZegyUkW8iUdKUuBqhuFemZh/JjXa
	 jtkyiVcqwb5rup0BydxLJWNxrOkwj86omTaKS5FQ9H+/vNqf9HcUKVre3Lb3ReiiJ+hei
	 2h2bD5+TkuAfwIkjvUO+knPKE0IgLSvaCyO95UVp40H5tJgWKRptL0YrWZg+TT3Yuam42
	 gpy94wgOPvG3ZVGJVQPObpTowb2KqP2lnMqIXLsNtcdAgsOFSrZYh1RnlKtHFt4ufOsNP
	 g60hHnbBIDBxmd1pJyOzRJzY+SnD6DSCS3mZ1rEa8u9IlAppZN5UtjvHWNmJ5RUpVVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BPmSpZSO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79305606A31C
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 19:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BPmSpZSO
Received: by smtp.kernel.org (Postfix)
	id 1558C1F000C6; Thu, 12 Nov 2026 19:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9D11F000C5;
	Thu, 12 Nov 2026 19:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794512195;
	bh=ew8S01e+Nzv/5iFYJj5QK/Jyqv5MbII/i0GQINqhdPM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BPmSpZSOjoL9VkjkLTThDqhEZRXg4F4L/cclDAGIsAE/9WVpad8PYac6C0uUz/Duv
	 1BLQN5FddcXQVsgb5P6wQ/cWylpxVwRAue/uLmTLBG8wnMpcipbQ8fVFOTD3gJAGTz
	 uAK7tKLpQ22+LmUP1lNBHMTUTkUFM/G7/helxjec=
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
Subject: Re: [PATCH kgl 0/3] Recover from a crash-corrupted feed state file
 instead of crashing
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Javier Tia <floss@jetm.me>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>
References: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>
Date: Thu, 12 Nov 2026 19:36:28 +0000
Message-Id: <179451218853.1693101.10791236029687003138.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=G41O+KGpn7DFmne2eY8flRPE4SM8zKLP9uIqeH9A0Nw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK+ido5awcp6troOWtIHEuNXjm99eIT8x8P97AanWq4F
 9toX5zfUcrCIMbFICumyFK2L3ZTUOFDD7n0HlOYOaxMIEMYuDgFYCLrnzP8zzzEscFtyae2na+n
 7n1Zo31l2eI3fKLtZRfPVK1lLja5tp3hf7ju0W8FEyRfcVwISyrO9Clsqonb9/Z+NufpqWuaDeZ
 vYgEA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> A host crash caught kgl pull mid-write and left one lei feed's
> korgalore.feed as a zero-byte file. load_feed_state() has no handling
> for that: it treats "file exists" as "file is readable", so the next
> pull hit an unhandled JSONDecodeError and that one corrupted feed took
> down the whole run, including every other, healthy feed.

Thank you for the series. I didn't take it directly because I've
identified a couple of other situations where corruption could have led
to lost mail. The latest master has both those fixes and your tweaked
commits, with your Co-Developed-By trailer.

This will fold into 0.7.1 that will go out soon.

Best wishes,

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
