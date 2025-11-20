Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3361E7C34
	for <tools@linux.kernel.org>; Thu, 20 Nov 2025 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763669031; cv=none; b=EuDWZ+U/Xjg/5NXmmtqT7ZhSTjGc38y9/DNB3r7Qe9eJq+Y9NjhGiNtQ4sOZQbqxKubuKJgU4KLqd9SwPU7g8CJkeaIkJX8v7EVCjiG4mUNsw+RDFSbneEPrDmRaEf2zePng0qQHpa1kc43pR+nCcIXtuBPklKLXlkWUwomZblo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763669031; c=relaxed/simple;
	bh=eSliMUz5sfI+WW3w624lulal7jt6qgx5bR0PIteJ5Ow=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ESJvxcE8AYPjAh4zQ//vKo+5exfejkrtYng2e9BsCiYUm1MgdH5dEa9pzf7CbgpXn34xZUSvWldipDtOZ6W1DnM8kHGR5fVsid+HpCKcrgnPg/0nKv+s0RCkGEmHjb30XTeLTggsN5qoaPDL5G91Fs8Mpf9Ax/KFQ9qCO5lz9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w5LJ9c7i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w5LJ9c7i"
Received: by smtp.kernel.org (Postfix)
	id 24CE9C116C6; Thu, 20 Nov 2025 20:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54F7C4CEF1;
	Thu, 20 Nov 2025 20:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763669029;
	bh=eSliMUz5sfI+WW3w624lulal7jt6qgx5bR0PIteJ5Ow=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=w5LJ9c7icdRTtV/bDh09X+IZO5frYyv1DC42rt2mGNV//B8ceof/DJmbPVfzlQ4mG
	 JZ7ud++TqRRG8gP9BUn49yuKMZOz9f4i6bjF74HTa8Kn/e7jsa8eNB6FH8HhKE86FT
	 YNW59WyLKysvg4vctnIjf6fEvCNYvutLYojX2Z7g=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Dave Marquardt <davemarq@linux.ibm.com>
In-Reply-To: <20251119-edit-in-toplevel-v3-1-64d5e721cb68@linux.ibm.com>
References: <20251119-edit-in-toplevel-v3-1-64d5e721cb68@linux.ibm.com>
Subject: Re: [PATCH b4 v3] b4: Create temporary directory in git top level
 if available
Message-Id: <176366902873.2236745.17708867537162842805.b4-ty@linuxfoundation.org>
Date: Thu, 20 Nov 2025 15:03:48 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-d67ca


On Wed, 19 Nov 2025 13:52:50 -0600, Dave Marquardt wrote:
> In edit_with_editor, prefer to use the git top level if it exists when
> creating the temporary directory. Otherwise let
> tempfile.TemporaryDirectory use its default directory. This avoids
> issues with Emacs and Magit, which insists COMMIT_EDITMSG must be in
> the repo's directory tree.
> 

Applied, thanks!

[1/1] b4: Create temporary directory in git top level if available
      commit: ab9639a7685a0e488f7d32783d55aaa2101acc68

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

