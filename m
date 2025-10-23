Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A0350A0F
	for <tools@linux.kernel.org>; Thu, 23 Oct 2025 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249411; cv=none; b=DSIdFBw7DYZtHpMJj1blZxnOS5vuEEqSR6utOQX9qcK1uc23kX6ImVuJJcYdKwsxqO1uxzb/oiayaggW2GjA7sERfx43vFhGLCAuaizEP5ieJOMGcAEpgro8kAxb8oXqJV9sYenVGS6II5e99GNDl3Tao2+ebdqwuWiQ2+GsDzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249411; c=relaxed/simple;
	bh=sxta4uaTtI49jpx+MDAWB5GlEdQLqgfsIWhojO3bDLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDp7N5WOJ7iFxr4nHDJ3DRGe8v9IG18gxwQq4z4P9WrhqfWMN4wiDi9TbLMKPx2HJOOEVFH3RiFbJIJez4KW020t4UIIOBCJHuw3d8x+mBkDncLr9yzL03xAFN+peu8sE8DscGZm/MIWwcChmCJ8zMGeo3bQ29aH0WjDM434JYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jvP1w28C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jvP1w28C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF19C4CEFD;
	Thu, 23 Oct 2025 19:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761249410;
	bh=sxta4uaTtI49jpx+MDAWB5GlEdQLqgfsIWhojO3bDLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvP1w28CAl829CRqcMo2fx/NS55LTu0/wvewt2OQ9Ue3idzfmB0+jj+hY7Etaxit3
	 ZKZFjERH2Sg3+AI0a5uRsgitGOEG64XV6ZsUYQhL77klUhzMNIoID6nXz6wzU66RFz
	 0jD2DZa/aCMkPapaRr41caS3Iu5X5uJ0JSYbMafo=
Date: Thu, 23 Oct 2025 15:56:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep (via pipx) does not recognize branch on >=0.14.1
Message-ID: <20251023-crouching-tangible-jacamar-e4f01f@lemur>
References: <ee6bab51-84cf-42c4-8ace-dd895f7d9318@kernel.org>
 <5bbab620-b942-4fd6-b15d-42b39736b01c@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5bbab620-b942-4fd6-b15d-42b39736b01c@kernel.org>

On Thu, Oct 23, 2025 at 10:52:27AM +0200, Krzysztof Kozlowski wrote:
> I know what happened - it is .mailmap which confuses b4. linux-next has
> now .mailmap entry for my address which I still use in this repo, so
> after `git revert 0dac0b74c32a1cc55f508dd95478637b15f4fdb3` the b4
> 0.14.3 works fine.

Hmm... I'm confused how it works. Could you give me more info:

- what is the mailmap entry that was added?
- what is your user.email set to in that repo (git config --get user.email)
- who is the committer on the cover letter commit
  (git log --format=%ce [that-commit])

-K
