Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16E038E120
	for <tools@linux.kernel.org>; Mon,  6 Apr 2026 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775498378; cv=none; b=nxEQPRBNB+eacHgDDUTH1fAAuUxfQXf8gKqB69kPuB5cweOyl7Eh395Nx8LJuqwqyA/wkscU1h2iOGmRwWNhXVV3oCk4LGkEmLg9RMnxDDM3wEiaU8ZDnawDrOt00ls9DPvkxPII/gSBTFcm3WyMMqrfayyFBM0Y773UQwjt+mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775498378; c=relaxed/simple;
	bh=OnBRP8BBvzK2EErUav1cwWUW41JvCa9VFxAK7iX0NtY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ayVvb+usO5s8X4tWTCQzlMw2JPj/8Osc5HaVxFietAXMRNaCq+H1Vsj+/QvMCWT1qDtQrhMnSbixKaE9fMnhzCVtqXoLoza9xKcR0arp7j7Na6CUKV648P5qz/K/mhGkXhEAntECIlnVaq9KAc1EEsInLYJzZxWTRFdZJv4Cq5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cBAlXPSE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cBAlXPSE"
Received: by smtp.kernel.org (Postfix)
	id 2C90CC19421; Mon,  6 Apr 2026 17:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD722C4CEF7;
	Mon,  6 Apr 2026 17:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775498378;
	bh=OnBRP8BBvzK2EErUav1cwWUW41JvCa9VFxAK7iX0NtY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=cBAlXPSEAUVNrCHTqhAH5Ft5SHiMvM3+Qd+eCwhIPre6ddYKFW5btQyK79nGjSKM3
	 P0zn7SnkTAv5e8HddYu2m4jWe/IKpI9uf0dtJyxCOteWMfroukRuhj1XyGgmTmjTH3
	 i13w/LzCqeDrWJn+SYPq6M3yP/IwXrzNqmrrRcQE=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: b4 review state is broken after series reorders patches?
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Kernel.org Tools" <tools@kernel.org>
In-Reply-To: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
References: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
Date: Mon, 06 Apr 2026 13:59:31 -0400
Message-Id: <177549837114.3355865.7109422546107942051.b4-reply@b4>
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=OnBRP8BBvzK2EErUav1cwWUW41JvCa9VFxAK7iX0NtY=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDIvf+k0Ff1Zksq/LOHc2UXrNwpZz9nhGNTJ6WGTFKywe
 3dAmeT9jlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABP5+Z+R4b/l/x9/yttW2TM+
 WHPmQVjEsVPZUVXWd0zqO3qfN8qtNmZkOFwSPm3jBfvnh7kuTDbW6G5t+f1oc/Pp5dtffX+YmDy
 XgxUA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Mon, 06 Apr 2026 10:23:17 -0400, Tamir Duberstein wrote:
> Hi Konstantin,
> 
> I reviewed v1 of
> https://lore.kernel.org/all/20260405235309.418950-1-ojeda@kernel.org/,
> but I was then unable to review v2; range diff failed with `Could not
> find series v2 in retrieved messages`. After some hacking with Codex I
> got this working. However, after reviewing v2 (which only required
> replies for three patches), the send email dialog offered to send all
> 30 review emails again.

Thanks for testing that -- what we're doing with v1 reviews on upgrade 
to v2 clearly needs some more thought, because it was written to deal 
with the following scenario:

- Maintainer writes reviews for v1
- Sender provides v2 before maintainer completes their review
- Maintainer upgrades to v2 and we carry forward all reviews for 
  identical patches so they are not lost

However, your scenario is different:

- Maintainer writes reviews for v1 and sends them
- Sender provides v2 in response to feedback
- Maintainer upgrades to v2 and we carry forward all previous reviews 
  (but they were already sent, so may or may not be relevant for v2)

Let me see if we can improve what happens in this scenario.

Tracking as bug cacfeb7.

-K

