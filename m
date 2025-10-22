Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A22F7AC8
	for <tools@linux.kernel.org>; Wed, 22 Oct 2025 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761163064; cv=none; b=l3oxLOtaOyJWdbK5Kvn0lcmW+wFH+czKXDMJpLWJbyA2cR7hNI/w8f4AyvDK3K95Ucywriw540yHf6iVjbLwWyDsfYSdMHGiwR6rSUL8CXXjaxwKZenmbGd99qatlw4ZacfkuD1EEgSKyfQeKweyQGUJ3t5B1pDAprjud678o9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761163064; c=relaxed/simple;
	bh=Jq5RNbcdPvQQxPOdXgZTZHBFC1J1P/ghisizo55jZPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tfAV7h9DgzRWaN+CpTexJYkukrNzVnGVJ0GKaxZoxAXL+0N9bdPh4+YO7ZnWfpRy080rVa7kf7u95TZWXPBJTClVZb4BldIyesHUjyJs0rJTYwaF5RlomJMt2jdEmWOO5GDK9pBhXkr1+5Eg0DrL/afOEH+fZv3c66ccNZeiVNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PUHku9bY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PUHku9bY"
Received: by smtp.kernel.org (Postfix)
	id 572D6C4CEE7; Wed, 22 Oct 2025 19:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BCAC4CEF7;
	Wed, 22 Oct 2025 19:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761163064;
	bh=Jq5RNbcdPvQQxPOdXgZTZHBFC1J1P/ghisizo55jZPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PUHku9bYmiWFgEJbjDAUyaiW46UIO/MRvodOyCZBExDPqtZRiI8e8xXnGudsWAWYj
	 9bd1n3x2ccoOg1Yn7MgKvhxZzbQg9GVu6ViT6jl5KXjxPIctZBLgnecykEV0SuHEc9
	 nB19/QuD+kjyNpq/nJLgEHFHQfYX21lnzM4hAx+Q=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Marc Kleine-Budde <mkl@blackshift.org>
Cc: users@kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <20251008-fix-quoting-v1-1-f07093ae1213@blackshift.org>
References: <20251008-fix-quoting-v1-1-f07093ae1213@blackshift.org>
Subject: Re: [PATCH b4] docs: b4.prep-perpatch-check-cmd: fix closing
 quoting
Message-Id: <176116306381.334203.9837934973123002040.b4-ty@linuxfoundation.org>
Date: Wed, 22 Oct 2025 15:57:43 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78


On Wed, 08 Oct 2025 13:09:42 +0200, Marc Kleine-Budde wrote:
> The quote starts with 2 back-ticks and closes with 3. Fix by removing 1.
> 
> 

Applied, thanks!

[1/1] docs: b4.prep-perpatch-check-cmd: fix closing quoting
      commit: 88d78d7ca3754dc84febb13cf0956cdc86bc80a3

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

