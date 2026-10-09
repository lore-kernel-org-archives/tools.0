Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA5478869
	for <tools@linux.kernel.org>; Fri,  9 Oct 2026 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531093; cv=none; b=ricH2vSVqm8PnYuwqRBwJl7yhYpRWj0yj5gOJ2e+NTuhXHGlEED93YY69L/E+WU4EUAVxRXnHf4S9zUrbSWPK+LSNOMLHlNAuNfdk7XfRXPVCSyauTzkCn+XBnjeXFlldp7PB39dq7iMi1y2ui/2AfmWMM60w+tUGM2vZaZRiwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531093; c=relaxed/simple;
	bh=9/lvOtEXU62ilnKMbCSS4IYPSCUQyILCKD+02fFojds=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZlYrU1CMYDRSLUxaCcWLGO65/SNtQlwtA/Gu3EQ6IEFHCiJbrL8jt1hN2K+WkkCnHdcLEyFNZwzpA/I7F0bIW0RtNv1YCdrrDzyji7NYo3vYXKnoFA1a8SoYT/s57GXrs7iHy6PvMVWAfF7hcMQLyLjNtsl8UDmXtwo6MpM1+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zUjGpEm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zUjGpEm2"
Received: by smtp.kernel.org (Postfix)
	id 65E191F00898; Fri,  9 Oct 2026 07:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A741F000FF;
	Fri,  9 Oct 2026 07:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791531092;
	bh=+q1+sva23hzKHDvR6SLevA43VJDtGU08p3gPEQDZ3e4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=zUjGpEm2/sa0J8H0EBORFOxsxx9eekL0Xh23V1FORbSwg31AMiz+ziLQ0YF3IWzwz
	 mhFLxPLhasPqBaIr9/5OLkvsbYpt1wi3WKSEF2IzUcr99KKWYyvvmJBV/rMEpsthM3
	 P6cAve/ct6su+CSkBeh+QdIjTFd5Z8DfkFCj8qAM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Mostafa Saleh <smostafa@google.com>
In-Reply-To: <20260808164708.1084648-1-smostafa@google.com>
References: <20260808164708.1084648-1-smostafa@google.com>
Subject: Re: [PATCH b4] b4: Ignore Signed-off-by trailers in follow-up
 replies
Message-Id: <179153108570.3568561.6504569285244775514.b4-ty@b4>
Date: Fri, 09 Oct 2026 07:31:25 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=333;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Wh75XKzL5L52OrOH3rkrESDDYio8kIl2BWIs7GPTKDk=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJOzAia+UR3Qj+rJ7f4Z6crFsUuO7ql1qiFXrpy7eHKy
 ZfC192z7ShlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCReVMZ/ko+v/fo+bmgnUtC
 Y77OPMU9cSUvO9+XtRHbTvo+uOWrN+0Bw3+P1Vsc3pyODW17vsxsruE/0bXXf3yQPCrilFPrsG0
 P4xouAA==
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Sat, 08 Aug 2026 16:47:08 +0000, Mostafa Saleh wrote:
> b4: Ignore Signed-off-by trailers in follow-up replies

Applied, thanks!

[1/1] b4: Ignore Signed-off-by trailers in follow-up replies
      commit: 663cf8ec750c1d5cf90d00d01c9ed337d9ec8e18

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

