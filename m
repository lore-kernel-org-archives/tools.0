Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED143C6A38
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180547; cv=none; b=OPeADbH5KnrMGX1zFRsv0hjn90k1G+DgUjOq/JmcnKVdsqoX5DLggxeVI7Rzu1GthOmg28miLBDwrFVEKAIo39EF0R+5kvqPgitRMIyI1dFmaIbQrHZmipWncqfGywA5ygcWTdWFcpaVyQEEACPPHhf5mr4oEkbqLfMnvCinFq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180547; c=relaxed/simple;
	bh=vX5RSV7MBMPZQ5tH4gzhH7YIaEJ06T8/ie/qAfIbjYk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lrueq1j2fOrheWpShPJ+V5FVUsAmNj9SzSy7/mkOvHynkaVIX+V9fsIxMMPmGa7WhbMV6SMGycCadj5AGkJgZVw93YnG6xw76C/n1TB09pIpwUvAXit747cg5yHsSeWG1cB0c+7WBY7nYm0FPeJQMq5TcyrbDh4BqAsppN2pzr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=urgSzNb6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="urgSzNb6"
Received: by smtp.kernel.org (Postfix)
	id A93F81F00A3A; Mon, 27 Jul 2026 19:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CBB1F000E9;
	Mon, 27 Jul 2026 19:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785180546;
	bh=0AE9LdInI5dyxGOSVoQEf661DtFEgs6ra9etGRhAW8E=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=urgSzNb6gfW8TUOGn6FydV3+/RLZ8FGnZgfajK1/tsfh551l9omj1IhKGsNrxGYP0
	 zDHFiMcbxxyISjHd8ZegnxnkPk5no3hmgVzePYysYtRxTBan7vpQLNcMAeqyX7aIQl
	 Pg/GW9ieBb+2kEo14Se5+XJnav3f1dwPbhkX1Zbc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
References: <20260701-work-b4-naked-cover-letter-v1-0-f651c2ffb63b@kernel.org>
Subject: Re: [PATCH b4 0/2] Detect naked cover letters that lack a 0/N
 prefix and diffstat
Message-Id: <178518054132.2787052.16962984302406008892.b4-ty@b4>
Date: Mon, 27 Jul 2026 19:29:01 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=H9OK7LvE/LyuupIrVkzTHT8aEQbhfmTFCSR30jT86Aw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLSNzY+mcHP/ad0pfRWZ0uxKOtm/tz3Qj6P+Bbu63/Cn
 LaitN69o5SFQYyLQVZMkaVsX+ymoMKHHnLpPaYwc1iZQIYwcHEKwER2OTMyvLzE/5p5zpcXPCwm
 TFrXNKYn3vhl5x05f2c4y9oXG99PW8zwT8tcbmHP2dJH6VfnrntzmG968ezJf9+9TtxdKDyzojt
 LkA0A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 01 Jul 2026 15:51:20 +0200, Christian Brauner wrote:
> Detect naked cover letters that lack a 0/N prefix and diffstat
> 
> LoreMailbox only recognizes a cover letter when the message carries an
> explicit zero counter ([PATCH 0/N]) or, via the in-reply-to fallback in
> get_series(), when the thread root carries a diffstat.  A "naked" cover --
> one with neither a [PATCH 0/N] subject prefix nor a diffstat in the body --
> matches neither test, so it lands in self.unknowns and is dropped, and
> LoreSeries.has_cover stays False.
> 
> [...]

Applied, thanks!

[1/2] Detect naked cover letters that lack a 0/N prefix and diffstat
      commit: 9f06e8f0414840d85bda14f91d70059d1c06eb3e
[2/2] tests: exercise naked cover-letter detection
      commit: bb16229f1f9990fb40938ab27673127daa60283b

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

