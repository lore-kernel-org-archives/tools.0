Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E691A682E
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 01:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053492; cv=none; b=mWPBt/gIDDi41Ogl34roj8ExGst2G7yBeLQLTt1iiY6EW73eJrocKBK8aqratBcJ1FunC42/6AUCn6+3AZVPV2ZvhZBQWZ29CbwpaRFbzhYEmPZgr5SkuUnDuHs/8BK1hb12g2j2ssUfJmXOd0NK1TPMo3/4JUch0NKT/6ZKvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053492; c=relaxed/simple;
	bh=OGMltazJqmCK6GD4w97SYRmCbqWJJUKNQDqlEBBHeU8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G4vWwYARA6BrLPGv/d9YKas/stA5BUydvUz54YxVHuAbS2DWXLFUZqdyIHMWM/7Uxrp3vj385TzdI1R1ZQvMGWUvAXxfYKGXngcmu9ReqqwtWcCCN7evdH/4kA46EAZZFZh7ufJ752t4/151KfWRujcqmjgJXca5k/y9uYvW6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MUEyyhXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MUEyyhXl"
Received: by smtp.kernel.org (Postfix)
	id DFA351F00898; Wed, 10 Jun 2026 01:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994121F00893;
	Wed, 10 Jun 2026 01:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781053490;
	bh=wNmMEjHrCHPta/qdXh/sXRfVdezue45luniYQCramUA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=MUEyyhXljALh5oivaFCa9tSTRZNhhaN2neWJmC5pmTn42abs2lqAPRdiTHLbeNwRb
	 Oo0GfY+eFcovC5+L/z9NqrCIYwZUUOJh6BhY7vBtOPdDpoizkK9jvNzhR1pJF/2pV2
	 f2YGOiOB0/EUQcKicO2UoFpi4We/WDzViESpXMvI=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
In-Reply-To: <20260605-review-double-review-email-v1-1-d52c2ca14024@kernel.org>
References: <20260605-review-double-review-email-v1-1-d52c2ca14024@kernel.org>
Subject: Re: [PATCH b4] Keep coverless review trailers on patches
Message-Id: <178105348391.129129.164597332331120891.b4-ty@b4>
Date: Wed, 10 Jun 2026 01:04:43 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=310;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=b0RT54413rCpwyH72l0cNCn1DyiIY0bBtb2H/nkwZSA=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI0dhgGT5x+6dGNrVUsp69XPFEUli7ntWG+cl+ULVFps
 W5+7KYLHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACZSfoSRYdP3IEGV2ktSGW+9
 wi6dP1ocPp8puFTJRaeJy+HJzYNVRxn+F4Ts9Vjr+d+44M9u5gvnL+lvS7rAaG4sdd1U60xcVno
 FJwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 05 Jun 2026 08:31:04 -0400, Tamir Duberstein wrote:
> Keep coverless review trailers on patches

Applied, thanks!

[1/1] Keep coverless review trailers on patches
      commit: 0fe1408d31e05241d8fc5ba34d6e92becfd448f2

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

