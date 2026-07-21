Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86AB47141E
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665521; cv=none; b=VYL+Un2wREag46ivhrO6zBG69ajS0d2Q608Ky5j+Qvvbc6EKRn0GcCdh4M94L182psLQZFsIRu0P46Lj6sofr8YD/AyTeb+83+1xkHgWkoB2PskZH4/FVNQ07wY50lSVsydl9jNuaakanSAZbtVC+UJYxxf6CaGFuwlrprMyW94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665521; c=relaxed/simple;
	bh=4ijin7l9jlogDMbozpMg898RmlF5W85Z6mXXEwJHx7A=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OO8grdAZtJFnAcaaKPLneTI/EdYl/VUQJnIhJDc5eLX4o6GaBn6I1uzaSmGjFqVKnRli8hDaOK2TsHQMCK8nbNJ9mVPLcxIlb4hblKDFmD6u1trAUr2TjaEZOozTXaYR+0O+ncMz5qBTVr9IWp2+6T960NNk2GR0xUiY9D6gqEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g0I456Qj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g0I456Qj"
Received: by smtp.kernel.org (Postfix)
	id E4AAB1F00A3D; Tue, 21 Jul 2026 20:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22C31F00A3A;
	Tue, 21 Jul 2026 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784665520;
	bh=mXanc5hDwgc0Cx6BD65HHZlsn3mapzPOzOjcQjBx9Ls=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=g0I456Qjh7sXLCDCI63DZQlqaChvQWiTlvIPWLYCwK/Gy4/7QJHsYb+WqOvo3wjVL
	 Empom4f+ccQenNthgCVRi6Hx/7m0Pf+8pLrR4JB4TyRqFsQnUp5iRiyoniFb/HAEy8
	 v1cHlkalcQusyoYhhCMmXN6yYxAnnLsKfkvN2KCA=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Jonathan Wakely <jwakely@redhat.com>
In-Reply-To: <20260720153840.2303110-1-jwakely@redhat.com>
References: <20260720153840.2303110-1-jwakely@redhat.com>
Subject: Re: [PATCH] Fix typo in man page
Message-Id: <178466551723.2052859.17262942098057497913.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:25:17 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=267;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=VqnIFUOPd+v+ZRunFhEb/z4TKj1Pc70tReu2nkkOUEU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLir66faf+isOeG42ndg00+h31qfCOfP7K9rWak0OJzf
 1qWycuGjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABPxTGP4Hy+uas58OHTr8cCr
 EdZ9j7L5F8neb9t98KLrvbOr6v/nTWRk2J+3vPr5lsLscra/Ufq20WkL76f7ON3/ImM/v8sq44k
 BGwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 20 Jul 2026 16:38:26 +0100, Jonathan Wakely wrote:
> Fix typo in man page

Applied, thanks!

[1/1] Fix typo in man page
      commit: 26e70c0d37206b63d46d5a445e93be869eb22f3e

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

