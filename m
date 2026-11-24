Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552085;
	b=sd76Js3jWHpYhV6XLLoVxXjB8pB+hc8QD0UiJGAhSv23QwdRKHWOI+LeVTclpb/CMqKz
	 uB9Bm+NNh1SyuOri1NXE0s4dKAH26GEyNrbQLALhGbfJb+Rj4mwnoBuQXckv6MbpBpoQU
	 fAql0GXosvsmXBFG1w1uOG1HRLgbfS6pkNmu1PKlLesW3R/oDj/IFK4m1SGQvCszRpZ7+
	 oCVJk0gMi/RGN6jtv++EFXUy3tQS3XfFkxR+5TJ8cI7XTY4/G2nLzrm1Ncsm8OA2de4TQ
	 VoLnqY8N6Hnj+mnBKLkKjywXGsw0jRcDvotOHS1rFWjBuv9dh4KlXYUimf4Y7jtez2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552085;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xC2Rrc9ZgoGVyJZQ6k1ux+i6+rVED+D2CLdaLOMfy0A=;
	b=W3xLOIL7cGiSlC1oyBsa8btz8te5yklfYJJf4ZT5AdWkg5UMqta804wtPatidtw2Ufpj
	 f9q+4VZ7OVHa4mcUobr6HJB9U7wqGVRtoBQ0nZKt6sgN8bscpZDAizHeTnKsPf1VeO/6k
	 +c/xTPECwUftMZPXz0vxc+BYLJ28EzSystQCjO2fcFq/MtRLoganBgP0vIA5haMEMjIgS
	 fGCB/0aNbw2yC2/3DCI0QSJzYKX7awZ8mGjf54Poyk0OUQ0Y8BaqE190IiJ6C4mpKZAvb
	 wZ3Mkuq3efS5pJGXvMcpgWQ55dcshd8Ffqv4SQfPio3sOhZ104iVSJlhOteBldF5JhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RFKQmo94;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBDB606A321
	for <tools@linux.kernel.org>; Tue, 24 Nov 2026 20:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RFKQmo94
Received: by smtp.kernel.org (Postfix)
	id A28E41F000CA; Tue, 24 Nov 2026 20:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600D51F000C6;
	Tue, 24 Nov 2026 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795552084;
	bh=xC2Rrc9ZgoGVyJZQ6k1ux+i6+rVED+D2CLdaLOMfy0A=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=RFKQmo94JqnFE9plzIkzvPyoU7cKnpfzA6N1M1DeBqWBoOduHWfUwHKnURLLlSh2S
	 PveVT95wDWUoqgBduFB+7+oNDu7MlKwjQa7eldB2wMFf22sVseb2Cy0w1xS90zchU/
	 AvZirvCEzyRJPAtqB0hwcffaxaJmr8tBUCv7Ig9M=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Thomas Bracht Laumann Jespersen <t@laumann.xyz>
In-Reply-To: <20261018-send-lore-subject-extra-prefixes-v1-1-48955111e886@laumann.xyz>
References: <20261018-send-lore-subject-extra-prefixes-v1-1-48955111e886@laumann.xyz>
Subject: Re: [PATCH b4] LoreSubject: match whole string for prefixes
Message-Id: <179555208010.2933355.11226200718565724543.b4-ty@b4>
Date: Tue, 24 Nov 2026 20:28:00 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=381;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=ZwBVCZ26FesnnlKsZm11isZx9s61jEXTt0kFFmqjeOo=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJZPweLX/9Rld5+5UqVhUTiu6D8B++7Nhze/HRGrXaOX
 MvZRb8NO0pZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEwkoICRoX/vs7Pqsl9mNB86
 NUX6uQtn7+Kkxlfupy6vmWfzVeqGmxAjw2zV0v2BLxLbU5XXxAWGpBsuZT6yW8rtLseBT6mf4lp
 P8gIA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Sun, 18 Oct 2026 15:17:32 +0200, Thomas Bracht Laumann Jespersen wrote:
> LoreSubject: match whole string for prefixes

Applied, thanks!

[1/1] LoreSubject: match whole string for prefixes
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=d33815df06130a634f98be07ad8e80d8459cded5

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

