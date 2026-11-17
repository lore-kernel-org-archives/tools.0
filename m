Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933787;
	b=o9umbj275wHqFL/luyhw8Gq9UCs1yO5jqbqEDxYeARtI8f65JhOHzgVamUY79WXO1/if
	 hOMmeaHWaHK4THvMw73EWODaBspT6FyHDU7cXZYoXb/p518lIk+hjX/wNC6IkkcuI/0Nx
	 5z/Lv95R2Mhid6M1lgNkQySUcFJebqmkqKnT4gwl3B3Cdan+FLj/LjbvlPefyq/zDKrpL
	 49H/J3WrHPLPt18l+nXiSZ/O5dBSNz4qdsFTVBrPi4SOHsxv87DLPWx6Dz7FQ/6zKyP1L
	 /60kkSfTbM+oDm1jkRPXNFakYfvxf6jiEAYz2Y9HFh27aAnIen6e4UnsaVMiiC+3w/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933787;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xCLnjFUToCJhQ3K0O6sHAwnKIm0kYZ2vxhRWi9APzks=;
	b=yZYIaS6Bj5/+Yq4EKQKp7XQj9HrjPIXLppqDp62prnqJYYCzjz5cLpIHqsy1zykDQUF5
	 D1UqiHIbYqxSv9zRDioIeIJZGqnXFotIK5zpgrTj7az+WTYYzxvjm3TqyJqO26ZMKNvND
	 Rn4fWKWayAwEMuCZbEa76n16Eizm68h1FDITBo760e4g3qsu0JNnlIJ3/TPEy9nCEb+MO
	 SBoNs8/JD4/1yBpnZacwBolJSH24sUoItpXw+gQdR3sio0yn7d1Y5N9RlHunwurZOekl0
	 YFTfHdFQkI9VPNgxuDSV4XJPc6LqnkxatAzhpZP+/pTLhlLrilgSOJXhhxh2n3QQQdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LBXIfxRN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36332606A31C
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LBXIfxRN
Received: by smtp.kernel.org (Postfix)
	id 096551F000C6; Tue, 17 Nov 2026 16:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4481F000C5;
	Tue, 17 Nov 2026 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794933786;
	bh=xCLnjFUToCJhQ3K0O6sHAwnKIm0kYZ2vxhRWi9APzks=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=LBXIfxRNQ/QGTNmrrtJQATesnxaCP+ztMzIv/kIQER5wRgJx+O0J/BRy+TcXOob0L
	 4eU4O6toBJuQOqMl3lZ+AudmfbiOkdfMpiZyx8pD8pAE6wRPTQ8cbJvF4+Re799pMZ
	 S2/FKhbSg055HsEppfkrDjmNgoxB4NJ1KwdAHRtw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
In-Reply-To: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
References: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
Subject: Re: [PATCH b4 0/5] review: fixes to track and forget
Message-Id: <179493377957.997809.8191363430779874360.b4-ty@b4>
Date: Tue, 17 Nov 2026 16:42:59 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=mSinS+WBSBpX10aWi/lN0ck0G3uqB4DWM2eHpA+Xyj4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLL+tIhl1DRv2OB0x2+C08q1v4z38weWMKSb/bkxZ4bM0
 ydHlx5Z3VHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAijikMf8U89RVf3FkRX/Jq
 40K5E0Y8JwXebK78efXC/B7HGTP67P8z/NM+f63hzt7KxKsnDt7veKI7626+ho+ruDP/+zNHAjL
 mbGYCAA==
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 05 Oct 2026 19:45:41 +0200, Clément Le Goffic wrote:
> review: fixes to track and forget
> 
> These are standalone fixes to "b4 review track" and "b4 review forget", found
> while working on reviewing a local branch with b4 review, which will follow as
> a separate series:
> 
> -a failed retrieval ends in one error line instead of a traceback
> -`--offline-mode` no longer contacts lore when rethreading
> -`--no-stdin` is respected by track and forget
> -re-tracking an upgraded series shows its live revision instead of an
>   archived one, and no longer suggests "b4 review forget"
> 
> [...]

Applied, thanks!

[1/5] review: report a failed track retrieval instead of crashing
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=83f8bf60f1fe933f8e9a222eab96249d3533d870
[2/5] review: honour --offline-mode in the retrieval
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=f7b040cb76db4703ec73015fed4a7943ade05155
[3/5] review: honour --no-stdin when tracking looks for a series identifier
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=1d1fba6b544983acce6fd3082600e162a6a6da76
[4/5] review: honour --no-stdin when forgetting a series
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=58afe876a5568678d6aeefd40e09519b52997734
[5/5] review: describe a re-tracked series by its live revision
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=89a90f05467e285cc657e2a3f8665d190c6a128e

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

