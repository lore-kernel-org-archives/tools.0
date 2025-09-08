Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908DA45945
	for <tools@linux.kernel.org>; Mon,  8 Sep 2025 19:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757361088; cv=none; b=G8f9bld9LAd2/HJANKVkkWzUNbPcbZWr+YjYvcwZqtr3bSA80DmXWVch+kICWlmYuP5oFcUGG2kvpCDETcj+McqNtpHmmVD4Rr45CXZtBTzm17Oy5WOqLT5p6UDggzhlvVY+Cee+DzV5p/Dk+7k/nz+yc+VA99W5xFhyG8QM98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757361088; c=relaxed/simple;
	bh=kD69C2NqoeMa+a0zF07/vrutuXe+GFUjlAbljq+h1jo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pKVeIe3LcZXQZVDN9/ooA2Zrnj/KC7dKkFn2A0ViKeE50xBRWt0E0VjqmkAEkt3jJu4arTwwsp5aVVe+RHTUXgtf3FU2rkJk4YJAxloDKNwcPkr/Feqg0rgMPmscpd9EkUF27QcfCSS/+LaFcnLTl8B3pMIRFuBMnwDdrbOwcf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0knaIcrA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0knaIcrA"
Received: by smtp.kernel.org (Postfix)
	id 34940C4CEF7; Mon,  8 Sep 2025 19:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49CFC4CEF1;
	Mon,  8 Sep 2025 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757361088;
	bh=kD69C2NqoeMa+a0zF07/vrutuXe+GFUjlAbljq+h1jo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=0knaIcrA8UJW/9+rE+injoIJTGko7JRfjx4VNPMoz3LgX0RG0ckznQ5LfpFQ0wGzb
	 BdeL8Qw/rZEgTOCPPJQCNTQ7yMG1PFmPrJ8OSHAJpizoRk0dkqcXwzToWmx77N/ywI
	 VWhq8abYnckwwmOWe2kJaDsFLXmO3FCe0j2PNKsY=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Jonas Rebmann <jre@pengutronix.de>
Cc: kernel@pengutronix.de
In-Reply-To: <20250905-versionparse-v2-1-4717edfb856f@pengutronix.de>
References: <20250905-versionparse-v2-1-4717edfb856f@pengutronix.de>
Subject: Re: [PATCH b4 v2] Don't parse nonstandard git-version suffix
Message-Id: <175736108776.1156904.15282144342041243952.b4-ty@linuxfoundation.org>
Date: Mon, 08 Sep 2025 15:51:27 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Fri, 05 Sep 2025 19:57:41 +0200, Jonas Rebmann wrote:
> In snapshot builds of git, git-version yields a nonstandard version
> format like 2.51.0.178.g2462961280. packaging.version.parse() errors out
> on this with an InvalidVersion exception.
> 
> Since we only need to compare major and minor version, and
> packaging.version is intended for a different version scheme, resort to
> comparing the two numbers manually.
> 
> [...]

Applied, thanks!

[1/1] Don't parse nonstandard git-version suffix
      commit: 5618363ab0142358a7a6a45e381fb6b7c10fe9b5

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

