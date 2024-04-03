Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A36F099
	for <tools@linux.kernel.org>; Wed,  3 Apr 2024 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712163328; cv=none; b=oKK5oICrhiF7BZyjrw0Xs0BPIE3gbxxLlY5PVwLM/4+9KhSKfrC9hm2u34pq27Bp/NZVsRvPT9LTJd92M9srppvcM/oEBNEzN0nmm25k2CseG7ZdsFUHxCmirNOVWzSUZhQr9ntqezQ3C0o8VSxYTI7sMqrTVP4RzHIuvFSLbw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712163328; c=relaxed/simple;
	bh=AZQLJMutpXc7+FCSpHaRN5uP8LedTcvlWInJfp5jmQQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Myr8LBaPKAHB4kdjaP3SYq/9gPQU8X86NI2GHD4DX8GWEkUr3drFz83+6oyjyjEIsJajkHVXa7r2j0ESg2GiY6WcErxARsdoJF2j0R+Nsz3M1Oikftf6tI1uiEyeHFihk+h45j7pNyUvGrUTTOJ/vznQsOEY7PK12t+DeajM1DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nO3mxYbO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nO3mxYbO"
Received: by smtp.kernel.org (Postfix)
	id 7447DC433C7; Wed,  3 Apr 2024 16:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE47BC433F1;
	Wed,  3 Apr 2024 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712163327;
	bh=AZQLJMutpXc7+FCSpHaRN5uP8LedTcvlWInJfp5jmQQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nO3mxYbOSgh3G6+HeejxxJTzFqv4PxdqZ/PhJNqFJYLRqs0b8+3iKKqWnpGmjdGej
	 BspyjcF5vadN+u9yGWQUdOCvjZ8HSpY39b1j2yZPLdK9pcBGPJnnbrX/PceO2VQzQO
	 xwFdKm/1+HZP3uHCJjhLoTRwX+y54Nw7xGlr5dCM=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com
In-Reply-To: <20240403-avoid-overwritting-cover-letter-v2-1-cb43a8df8ce2@bootlin.com>
References: <20240403-avoid-overwritting-cover-letter-v2-1-cb43a8df8ce2@bootlin.com>
Subject: Re: [PATCH b4 v2] ez: Prevent overwriting an unrelated cover
 letter
Message-Id: <171216332586.1200990.607530837912420309.b4-ty@linuxfoundation.org>
Date: Wed, 03 Apr 2024 12:55:25 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev


On Wed, 03 Apr 2024 15:29:17 +0200, Louis Chauvet wrote:
> When editing a cover-letter, b4 expectedly selects as base the
> cover-letter of the currently checked-out Git branch. When
> saving/closing the editor, b4 also saves the changes as the
> new cover-letter for the currently checked-out Git branch.
> 
> While simplistic and apparently totally fine, it does not play well
> when working on multiple branches. Said otherwise, the following
> sequence of events will write the wrong file, possibly smashing a
> valuable cover-letter:
> 
> [...]

Applied, thanks!

[1/1] ez: Prevent overwriting an unrelated cover letter
      commit: cfcbbe6f23943166f11687ecf37252dc20728639

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

