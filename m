Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9291342980B
	for <tools@linux.kernel.org>; Thu, 26 Feb 2026 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123937; cv=none; b=UhfBIHIzK7qnXKIRt6SubvzWVMz5opd4Go6KxILeKu2J80ZXJspgZMCMkxy4CQC5/lzP4RRn1gSXQ4j3CG4txJ2y5Z9xHb/0NVHWdm3p1oYC41Q1Q4Fo7jDl/o3q/fNfH6xkd8540rm+dsR2qbikscNlfEB/k8E5WIU1YHboK3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123937; c=relaxed/simple;
	bh=/t6WLiMvb9NP831/T4K5iNqIUtQkkfFcsUYWoUYGJN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qs9DM9JLFAO6fzmCrfzlaD3MSYot+VqVhxFo9AkiByx1/RG2N9lgY1fjciN/jgIQQyYSYi7SZfhS5X8MMYPj6Svu4320go74GoPIcdOAsBwKzG9Fhjysix7IsccHJbaseToKDY5uBmoZUvy1vdIh9kKF0URcl6FOjiIIA0b63UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QtEJD/vS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QtEJD/vS"
Received: by smtp.kernel.org (Postfix)
	id 53667C2BCB1; Thu, 26 Feb 2026 16:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5B1C19424;
	Thu, 26 Feb 2026 16:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772123937;
	bh=/t6WLiMvb9NP831/T4K5iNqIUtQkkfFcsUYWoUYGJN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QtEJD/vSKmD4ZulqxJh59Tk6uHZbgzFR/xT2AtSeL1wqUtFjTbgDVV8GoPmyRrhhR
	 E1qj//iwLpXH+GqwZWjJOF04g10EeikUcf9JzLq8f+ZoZwJHc/Z73v6MizW3DFb951
	 eGdRCey4FtWOFFClmD0IR1OCJsktv78vB+WWj5tk=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260226-multiple-prep-cleanup-v4-1-c08834685aa3@bootlin.com>
References: <20260226-multiple-prep-cleanup-v4-1-c08834685aa3@bootlin.com>
Subject: Re: [PATCH b4 v4] ez: allow cleaning multiple branches at once
Message-Id: <177212393256.306215.5273621962659097491.b4-ty@linuxfoundation.org>
Date: Thu, 26 Feb 2026 11:38:52 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1a2be


On Thu, 26 Feb 2026 11:05:35 +0100, Antonin Godard wrote:
> ez: allow cleaning multiple branches at once

Applied, thanks!

[1/1] ez: allow cleaning multiple branches at once
      commit: f57ceb524a15e55daa7573751101d67ccd50a7f9

Best regards,
-- 
KR


