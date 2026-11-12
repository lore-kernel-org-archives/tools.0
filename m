Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516087;
	b=wE3ExkumN5GKoFb30U5DMmAFzVmQFQ2aea65aWIK5eUNBcYdGsljLRsRIedMBTWd6Tbf
	 DXTDhgavxeHSzUjdASyz8BQ0EmdhR5j5qQGyJuY0o9j7i+FXoQs4VXlFxfr/JvA7t9OZV
	 vF7C5f06VdxfmhQ/tgqJUK1Xu8aBwqemZCbmgErzjl8kd9wiSkeLigl8/KzvVGSfqX/bW
	 My2748UvbHeP36uRPrK9o5CUQir/IKyEQapoOIk3aCygklBMXCcYniVSUOFrzhHWrLDFE
	 tLeGC1n5EPe0ksbuxuUvE0gJZJYHu4XSx562hE56dKOb3pnvH7AfN+/5en6dQVZy0pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516087;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Gwq6HVGBGXz+pX5CsrugYYAm0EQAgzMPtmKoCwi/zto=;
	b=tqp1TllLzTrDaQYhpMFJM8GcgNfasMdhWDk6VdLx1DOlsxdxEsgTD78NTQW77+fCCPcT
	 PdLdttQN1JSp/+jL/U+X29NbURAgoLQHAmPi1B/mWjwtJrXf1Ers4hmTP/Nv0oH8za6go
	 W1GlguXWxYWXuMcf+ZNQ5YRgNjSA6hPXEtgX08vJlz2dNgBIGYprHZsBshlFwgE2ZxUXM
	 M1GwudiL/0k0bmSUt+OuXL6b+xH61btZBwrvUfdAG4uQgN6ctaMz7ufWNfJhZ8VfxD7z/
	 b2Y8d2ZvUT9PKHqIoUhLnxs8+o9f0y7ZlZ6zinfvq6SJSnrNFQAv49v7+oVCvgfCs9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MH9B0zGu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01DC606A321
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MH9B0zGu
Received: by smtp.kernel.org (Postfix)
	id 4CB851F000C5; Thu, 12 Nov 2026 20:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082571F000C4;
	Thu, 12 Nov 2026 20:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794516087;
	bh=Gwq6HVGBGXz+pX5CsrugYYAm0EQAgzMPtmKoCwi/zto=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=MH9B0zGutjdWqpIm/bfpkQURlOwvm/BuXC38Fn5dI74fEHWWE6R5/AgDLTCRNc5Hl
	 4UsSqiQP0yqK4JF2NfbZIDuOf+/wAlsL4iK8mr2LPNdUqqvKyAyv6KoalvcsoNtME1
	 jzJXb0JBcee7zHQZ1pEj6sPfqZcRf4cVo4f7kduc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Hugo Sales <hugo@hsal.es>
In-Reply-To: <20261104150658.2189226-1-hugo@hsal.es>
References: <20261104150658.2189226-1-hugo@hsal.es>
Subject: Re: [PATCH patatt] Keep identity lookups out of KEYCACHE
Message-Id: <179451608286.1804535.7629333236650774873.b4-ty@b4>
Date: Thu, 12 Nov 2026 20:41:22 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=354;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=UIvUx4zw9KxNAsKRhZx/jCGX8SBR48PhcV9rNYTr6og=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK+qZS6PS78YPFo8rMnjed23up1rV1adnfbtVlSyj0mr
 f8jb6Sd7ShhYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCRXUsYftxLUNgf/cD1q/ax
 s8WzZCy9F25odLq1WmDJw8Lc/O4vyowMO78enu6xZ/cE3YmPlsX6J/zgmHq5pOnefvXHxb1bk45
 4MwMA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 04 Nov 2026 15:06:58 +0000, Hugo Sales wrote:
> Keep identity lookups out of KEYCACHE

Applied, thanks!

[1/1] Keep identity lookups out of KEYCACHE
      https://git.kernel.org/pub/scm/utils/patatt/patatt.git/commit/?id=7a5e62fe934aba9062c614a7042cabf4bbad503c

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

