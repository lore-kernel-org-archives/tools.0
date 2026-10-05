Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E07478E39
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196924; cv=none; b=j0xjJJ1CzBVz/qPL3KnCSmRUfjbZ4FaroyWhvXk3+JbGduEKwxpyYEqCUbxc2jORmDBsIjNITG9iLo0FXU2xZGABQ4QCyvuVeHabv4Mk2EDCcIbpo5van9RW1JpzeIwcNw3FzjupdKFXuPNaTDG9q3Ll1UElcmAZ980jX+U1l0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196924; c=relaxed/simple;
	bh=8T75T7mGximrDNfaB8x/E/tnlBzA+tARnxeaQzcC3/I=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lDbzXh9MDMG2lhBTRrNPYnA7s+TUF9Ci7xZNer424hgL/xcAQTTTXyE+5BnFxvZmOG+FM7jOnPxaewEMn9/zHrSywzGwzoha0d+txdP4yPtCr0Hbqilkj1gGmZB8SEF5V5QotAI+H3CnVvaGOCCg69zPRDTBEWjs2xvFRANWkSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yyJHjnlx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yyJHjnlx"
Received: by smtp.kernel.org (Postfix)
	id E47741F00893; Mon,  5 Oct 2026 10:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F54E1F000FF;
	Mon,  5 Oct 2026 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791196922;
	bh=WhQFiAs/DZMyJcHVXX+TvQMPifJPpEQUxOuv5Aa4olI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=yyJHjnlxNCB32qGg69EF6ApiDhnwvje+2EXTxiA7D+9Hs+YH51d2lcUYL5ca6rCmb
	 FuC46FjlqeNhoFm3LG1kd41VDzEDq04Cs4Gdrz6UD1VW2jKx3avV4qKNTwjNZgTQ5D
	 v3pRKrR2VOBajhRa2nICH3c0Lsuajgbra4UqkZac=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
In-Reply-To: <20260925-fix-list-comment-v1-0-0c4c9599d3e4@baylibre.com>
References: <20260925-fix-list-comment-v1-0-0c4c9599d3e4@baylibre.com>
Subject: Re: [PATCH kgl 0/2] Fix mail addresses parsing from `L:` entries
 in MAINTAINER file
Message-Id: <179119691592.1815446.16575388846251881579.b4-ty@b4>
Date: Mon, 05 Oct 2026 10:41:55 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=B+RkMhYS7EBklPZYyu8sfhfBFA22CCubaeUbb18pSsA=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIO1/1QfbLdVeJ9ncsErpt9IhMMrLt+2S1qO/Bhuf7zr
 /2fVy7c2FHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAiT04xMvyb9k+z8ivrsZWR
 f7bP6lypkROf9LHCdoVc+Gp3N0lhzccM/90W1ZT9u278vnmmedWP0MnTed6lxaw4HOARvPmc9fL
 8m3wA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 25 Sep 2026 12:30:10 +0200, Clément Le Goffic wrote:
> Fix mail addresses parsing from `L:` entries in MAINTAINER file
> 
> While testing the new maintainer container[1] tool, I subscribed to my
> prefered mailing list but I ended up not having the same mails as in my
> local inbox folder.
> After investigating a little bit with an LLM tool, it found an issue in
> the MAINTAINER file entry parsing.
> 
> [...]

Applied, thanks!

[1/2] Drop the comment from a MAINTAINERS L: line before querying lei
      commit: 428baec86eb5adec79ae7931dca7055bb1bea5e0
[2/2] Fold the M:, R: and L: branches into one table lookup
      commit: e24b2bddd9ff7d4064a8f4ea4360f6f987e1ecc3

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

