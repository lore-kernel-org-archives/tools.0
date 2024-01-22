Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71856464
	for <tools@linux.kernel.org>; Mon, 22 Jan 2024 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705944668; cv=none; b=VQXV/kncH8aa3804DjeieSkHLeHcK82LaKy5FlVcFqtlL+kSkHgOEujqKA9kJaq1CykWH39whHCCtERuV9sWyDCcxGaaLQPRo7mLQprfr/FoFkIU/IWV2DygYGn1ET9ebLND5SJS8x3zctnU/PPoCF1UPAFpqL0TAoVi5MOqRMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705944668; c=relaxed/simple;
	bh=a6D/K4GAbbgpEEbKyFV+mmV8xkG/O6RPu7bGXYr8eyc=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=J2ZIzlfClaOmlKhssy2qMm0VetuSEWzYNKLNiFJNYAobi9YFRJCI9uVrFTxHC32afiqdQnYpMuUYI+3numo3HzvBxTA+GwaFNNr1fexuc4Dljab4OvF8xnHGY6UQvlW7nbXOF1W8GlcjT8RUkKTq8fLK3sPodwQurnq3w62n39s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRJmjg1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRJmjg1b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 056D0C43394;
	Mon, 22 Jan 2024 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705944668;
	bh=a6D/K4GAbbgpEEbKyFV+mmV8xkG/O6RPu7bGXYr8eyc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HRJmjg1bTywsLdH73lOzMPBxATtL+I/t/1ntoV6WLQ9LZNo2+I7m8Mubgc1Iw6jtZ
	 Nu8Cl4bfGtadiD5DzwkmoFZhWmIWgKY+rx33TcOwoM0vmSEnsTCY5p1JOsZ5xLcBuz
	 O8bCly4mJtbDYwzzalZgj5/W0+GKOO+2sZtTozHJmE5B2TPtNIB0aZUXakS52J3kyn
	 LDIBAbU3DOzzCossFwXtBgZz9vtgV/0cBtK7WVt9YWKZh67s9SLTaNbBDX46TBkHOS
	 7WNfCko73p6S3tHxlzdAJ6Ob9KLmebuX5Htk+c7F8MrD0eYPqyZJQMrMzdgqJAw2Ul
	 EdThpqzITodSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2E90D8C9A8;
	Mon, 22 Jan 2024 17:31:07 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, broonie@kernel.org, 
 tools@linux.kernel.org
Message-ID: <20240122-b218408-1cf707928fc1@bugzilla.kernel.org>
In-Reply-To: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>
References: <47699f5d-4ba3-4438-8a78-ab6c3345840a@sirena.org.uk>
Subject: Re: Scripting support for telling if a b4 series is sendable
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Mon, 22 Jan 2024 17:31:07 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218408

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

