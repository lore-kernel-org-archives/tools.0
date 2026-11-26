Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663167;
	b=IEmmDjO3S6nWuSfTkv4prz2tV1kP6aR+dJcyXoRLHhKUDS/mXO8RYq/Yxb2dtxmiesjG
	 M9qqUeh07gESyvE4cy4PkLltd2O8jmq+R07q8wt9C7o/d0V7BXa2JXJb9JESFwuM5SGsB
	 eF0mBm7DWz4+jjmJndDgz9YzqxItHNmySLhhSBaSB+sQoIxTD9gWhUUQC0ELKR/HHOMT+
	 fumj1V+OU1M1DoW524eH8q9WJEgVleSOsStv7iSZ0GcUEOenY7PVQtZEG/lnbFrc2AiZn
	 WOrMixd+LN/w+HqPt2K0udnzk1HrdGoFFw5M986uEjy3TyR0PllFunCmd6MSdFtYOCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663167;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=I8xs48E3Xe2L7kh05hUt4ox+SZ2oN72t737kCFCdakM=;
	b=gP7HtuuVSXZl8CXZ3sglzRBSLIOTACxquEX27bpwQ83Vjinfl9Lq9/WlMbEDQSkV5nUN
	 OhUNKEHwpECyg/GVWJHw9wUnratZP4dFybMFMWQZGbcPF3iI1QsTvUM3mM0PciriJRXXO
	 o3JNW55+TIXtefPq/TFEv5idvjmWTaQ7QAQgTx7ylYA8kX6w9UEhEbaSlrn2yUCC6iAhM
	 q5FR9avt2iRIPu4G5Llr7pJBRTflnTGVWP1V3VzZBVGWI2tjg4WQoXFBuJkD8TqMU9Zhn
	 J7J3cNnQy3B4WCgzb/I0Ho1kpE5tPrZmXiLvSAq8y7XiuPFjG42l+/fxoJ72z+7XUlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HZcaAN5F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D1C606A31E
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 03:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HZcaAN5F
Received: by smtp.kernel.org (Postfix)
	id A560C1F000C0; Thu, 26 Nov 2026 03:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442AA1F000C4;
	Thu, 26 Nov 2026 03:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795663166;
	bh=I8xs48E3Xe2L7kh05hUt4ox+SZ2oN72t737kCFCdakM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=HZcaAN5FRlVJhr7lgYzWZrssUU+o2thfEt1H4/SgFfnktgL0Z8c6Ng+4v2zWxoc/b
	 kkCRfsHyFEY+aAjITd/v8PBvaXsriNROoLBaW8yDX+ajaRKP8S/dDlKcM8R+nED5cV
	 5N2YH9KMEGhsFf8W3Z1ns5vpJICQVXTRXXvgENy8=
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
Subject: Re: [PATCH b4] review-tui: add a discard_review command
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: tools@kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <0-v1-ae4a80b77311+75402d-discard_review_jgg@nvidia.com>
References: <0-v1-ae4a80b77311+75402d-discard_review_jgg@nvidia.com>
Date: Thu, 26 Nov 2026 03:19:19 +0000
Message-Id: <179566315935.1145923.12454369097011668679.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=409;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=sfg+v/WiJpL5JYF/sCdHnFxvmztOzzj/1qzb0BUvcAA=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZl1qIGsTy+wbXq51NnPlSIa1gQvH3jWX68rn5Xuwd+
 4ROhc3rKGVhEONikBVTZCnbF7spqPChh1x6jynMHFYmkCEMXJwCMJG8dIZ/xs79TdzT7DY8kivK
 rZ4a+KBC+aVuyTKlVR/tpgdvnfR6J8P/0olxPEYzo7b5lG5auSNUZ8PEzaeULYqYG98YvQ1JDfF
 mAgA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> On the email screen with a patch selected this will discard any review
> information the user has created and set it back to the start again. It is
> useful if too much quote was removed or all the remarks were later found
> to be incorrect.

I reorganized the commits a bit and added a few tweaks, but this largely
landed as-is. Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
