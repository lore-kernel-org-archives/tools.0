Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0799A1D1F70
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634035; cv=none; b=brNMLbDCu0mCthY8Xk8mtMml16qBRHj+SwLIGj2b/tO176NPJcswPItTMvBIPh8NOvKq/93BmLEt+QXDiXzb6P9W3FrV6Nq3n7zcN8clwXiaI2GQ5Q7FsDB+5J+5qYo6rtBBNyGr5z1yPW3fIcYFTyPeielvDyF7HWyec24aKhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634035; c=relaxed/simple;
	bh=ZyGCLu18Eo6qwfGkIHomxmTDkeZZxq+ycHrUPNdywmQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=te3TJLHLaUNXvCVOoNArsQLMbG8AgnZMy2m1l9PULS0BY/ykBJVIVW30UP5DKqk91MSVaoxI4flUZnSQ6vpRmTauV5yXJBoS//ygrenNDWJaWeBTsNavBKNKi3VlITzKk4M1p9I9HRwQ4zD4UlA+s/OambAMcXEFghnlhQhtCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CQuwy5r7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CQuwy5r7"
Received: by smtp.kernel.org (Postfix)
	id 8EFCDC4CEC7; Fri,  6 Sep 2024 14:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAFCC4CEC4;
	Fri,  6 Sep 2024 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634034;
	bh=ZyGCLu18Eo6qwfGkIHomxmTDkeZZxq+ycHrUPNdywmQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CQuwy5r7XjO8OmHqf/6XQfZdtYWL2APQS99vkeg4gQVdC43Eglo7lUK52s5cDdfuO
	 bGnL8v+XmrZa9yTHwwH8V4GB+MmYfq+Bt4DYDj+L/XGyDgOPtyBQAFD0Qvrxj3q76H
	 YNGXw9N9bodvrWgBUImDZDPnefmQuSamU4qfcJlk=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
In-Reply-To: <20240827-fix-binary-patch-v1-1-98a3090a69a4@linaro.org>
References: <20240827-fix-binary-patch-v1-1-98a3090a69a4@linaro.org>
Subject: Re: [PATCH b4] Create patches with --full-index --binary
Message-Id: <172563403419.23316.3838590758431527276.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 10:47:14 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-40f6e


On Tue, 27 Aug 2024 18:30:17 +0300, Manos Pitsidianakis wrote:
> If a patch contains binaries, the git show command b4 currently uses
> will not generate a patch that can be applied by git. Add --full-index
> --binary flags to correct this.
> 
> 

Applied, thanks!

[1/1] Create patches with --full-index --binary
      commit: 23a9ddba10a057bfa9c438c0b50ac36d278ae022

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

