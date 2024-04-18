Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE715E20F
	for <tools@linux.kernel.org>; Thu, 18 Apr 2024 17:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713461727; cv=none; b=UonilhUSEMSA2p+X8vy+XFDJb9v0+sVfuu6qHboUOYtjyi3W4hunOdwy/mMZdhmWiTLyskGAVdjaVF4vwMRzjL3h35r9gBM8MrcaG7Th17k+oESg5B67Fqp3aZyXWTcl5Lbgn+LIr8cZvRE1zKz65qFT+Jjo1UtQxZG9UQxbLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713461727; c=relaxed/simple;
	bh=kBAoT4t4zpqWexeJBP5/PoyXtd3gFiyIoMa2dUXGUZY=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ZnqvUuk1OeCFCp+UugiwlvgsQw7aVN0clBhLONdRAuZ5amfYkpNUUOW6a3/zbWtebhO+HKZgMjCAZ8MGeFDz8PugGH2lclTgbcvUjpZEi0Dgg5SMNUBxMGmARx9jUQerlyYDjQP9bNBvxVn1yX4FgeHmCeaaPLGTk1xuYkD/8NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkgEfMLu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkgEfMLu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09AEAC113CC;
	Thu, 18 Apr 2024 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713461727;
	bh=kBAoT4t4zpqWexeJBP5/PoyXtd3gFiyIoMa2dUXGUZY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gkgEfMLuwNiOlRXqqWPQJOsd5dvDaY2cznotFSTizdaOtTInyRX1XY2uLgIf6NluS
	 dz/NBLY1CHgyYblh3rG88Rd2vn5e3pRlPW6vzI3037K4ZnX3aHhwn+wdZ0NvLX4r1H
	 FenXa/0Ss/9C5yJgqJ4pmgfa8RkO66FTdwNqIEZVS0hpPiIuEWImQEbmJafeOS8um2
	 6KI75VUQYT3ERjyWAPLQEMlyzebzitxnuwUW51tWa1+XA5dmcL6dyU8b3N8uWYO7IE
	 ujyTMCmVITyaK+3kx6hZHY2xJct2bEh396TTvYMq8b8ATeK45aOSSZKu0roVHX1fBJ
	 w8XTaSKWsoD5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E5CB1C4361A;
	Thu, 18 Apr 2024 17:35:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, broonie@kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20240418-b218706c2-ff833b3314e3@bugzilla.kernel.org>
In-Reply-To: <c9a9347a-b795-4824-8edb-9fba31cdfc5d@sirena.org.uk>
References: <c9a9347a-b795-4824-8edb-9fba31cdfc5d@sirena.org.uk>
Subject: Re: b4 needs-editing check vs single patch serieses
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 18 Apr 2024 17:35:26 +0000 (UTC)

Konstantin Ryabitsev writes in commit 11c5cc46b7f4bb10c134e4ba05e984e8ab13ed6f:

ez: improve needs-editing logic for single-patch series

When sending single-patch series, the cover letter does not need to be
edited even if it contains EDITME.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218706
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=11c5cc46b7f4)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

