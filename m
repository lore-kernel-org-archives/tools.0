Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174B12F368
	for <tools@linux.kernel.org>; Mon, 26 Feb 2024 18:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708971597; cv=none; b=t4ubbrtCMCzm57m+bznYL6mjpwOub86zOOk1r+3CYki+Xqm939OcNK+3gnSqT9GMaT2Ordpts3J9ajM34hERFb8ZgR7zkqQAcnS3uEBJxP1D1s7hQ9loTlUqWb8v1o82nj7pPQBh5Mc3pT/p18h0DxJMw1Tx1607YUCAUNiQpN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708971597; c=relaxed/simple;
	bh=Rh+Mc7CXGkZC+6noDPVeJbSnkiXRO0Msvd6PMQvomxA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aCAlFYZ+UD3YglTiDq9cW8QFK9zObUMwr6AUaFKJAdgf+jPMIAKvFeYKIJWNfMOmHQlqn2kkoEq6MfReA2AChxNEQ8TR6YykwROYzV4eVhPAi5Pb2cmMIZSf8Y6oahsAwUgYCg5DjLOrUERzlxBpfrcpzdBmVp03EV+VUVCX7Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yFC7nzk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yFC7nzk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B327FC43390;
	Mon, 26 Feb 2024 18:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708971596;
	bh=Rh+Mc7CXGkZC+6noDPVeJbSnkiXRO0Msvd6PMQvomxA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=yFC7nzk+eqPDmTh9qMLwqJ2oXw0vaSYg+9jdmaE48Rpvohmht59U6Lcyc1zWZCmbu
	 9wq3lSm9Nf49Mt6rwaPH0OuE/EyRwnW4egJyMW/2sftHQplqQUMeBrV60D46NDwk6o
	 1/ZCtGxChmQx8w73GxKWlkcqGrD5ONUUK6ofkh9c=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
In-Reply-To: <20240225-ez-range-diff-cover-letter-v1-0-0df35b63bcf2@gmail.com>
References: <20240225-ez-range-diff-cover-letter-v1-0-0df35b63bcf2@gmail.com>
Subject: Re: [PATCH b4 0/2] ez: allow inserting a range-diff in the cover
 letter
Message-Id: <170897159660.59238.10525397362650517308.b4-ty@linuxfoundation.org>
Date: Mon, 26 Feb 2024 13:19:56 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev


On Sun, 25 Feb 2024 17:12:19 -0500, Philippe Blain wrote:
> In the Git project it is the convention to insert a range-diff in the cover
> letter for subsequent versions of a series, so this patch series adds this
> capability to b4.
> 
> The first commit is preparatory, to document the allowed tokens for the cover
> letter template.
> 
> [...]

Applied, thanks!

[1/2] docs: document tokens for b4.prep-cover-template
      commit: 75f18a72fbdfde6155b3aea6e1d434a5ca3a3499
[2/2] ez: allow inserting a range-diff in the cover-letter
      commit: 6b2642dd71e7acab5b1dc6960312e6bbf50a4e81

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

