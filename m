Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479337B00E
	for <tools@linux.kernel.org>; Mon, 27 Jul 2026 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187679; cv=none; b=tlm0dp/rUm/xBsZOMbc77yb0T0mi5S5r9dOKVVmpfpUbELY+eD30l2t5E8fv5+aWJ00+vZNzg70oXD9yzAjdULz56Exdg0HBhRBoJNec6xr8516UOLOT1EZV8zVnwlhD1rmX1l4E6+I1CEDxsILYCQQtSf7FH20NoZk6YSyGlG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187679; c=relaxed/simple;
	bh=04pqW5dtFpXqT7LP9aGyCZmC4JEiPIX88d+e0sB0ARY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=POnpyVhN8DzCRjfKdPZ768vMcTIcYnfeEeJY0yUgv2zAj4OsjY3/ZHmQyElejWaL97Cih8LOkPYOyjhR1kfgNFRnOyeTjRFyzQ7lyLhyiUXNgP30cBbgDHQUTc6+1r1gEmvGYzd+auDIKXza298JTAm5l3dIQbLM7G+GBNJ/k9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lu1m1uqF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu1m1uqF"
Received: by smtp.kernel.org (Postfix)
	id C56101F00A3A; Mon, 27 Jul 2026 21:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2571F000E9;
	Mon, 27 Jul 2026 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785187677;
	bh=+1qVn6ix2n9GW2n45ZN+vZM3+ljVjscmW4QBjohM7y0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=lu1m1uqFfOQP1AdRljAgyh6kFL4OK/uqwJO8DOizeMfE7ylJXCMlfpgTDzC3H6cbw
	 fRuS34nGB/cvhdnzdm60c65ZOC7m7NMXVY8nXYnHdPpc/P2hxXNnfkHeR9i/Q7bsL1
	 ut61A+JBeFrI4t1fSS7EuXyaL8y/rcs4HOxefsBvtZ2Imqfw0Desry27eFZgTjTWdr
	 QU7kNCLyMPjuyNwyZhOKFlKVD/zXOqG3ozAuOt9xonOf5WD1zDXC0RKiIaGzDCLB+z
	 Y7KrdNDd6eccGVrw5i2KEdbn2ppvlCLzv6C7+4Xg4zF4tc/B0oKobd0Pmxg8blJp17
	 yFkShifv/Emew==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 00/11] review: track and browse every version of a
 tracked series
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Christian Brauner <brauner@kernel.org>, 
 "Kernel.org Tools" <tools@kernel.org>
In-Reply-To: <178518503184.2983685.7373099669069578683.b4-reply@b4>
References: <20260718-work-b4-multiver-rows-v1-0-3c539d2a3095@kernel.org>
 <178518503184.2983685.7373099669069578683.b4-reply@b4>
Date: Mon, 27 Jul 2026 23:27:54 +0200
Message-Id: <20260727-checken-gastarbeiter-eintagsfliege-d025f1f4d98b@brauner>
X-Mailer: b4 0.16-dev-09492
X-Developer-Signature: v=1; a=openpgp-sha256; l=728; i=brauner@kernel.org;
 h=from:subject:message-id; bh=04pqW5dtFpXqT7LP9aGyCZmC4JEiPIX88d+e0sB0ARY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWSln43ZZiSrUbWk8cK8Q1v2CPxuvpJm6b3TL0spb2LlX
 KVzyVbpHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABPhLWRkOBoWl8n9IqSlXM9t
 Y6aV36STqeFfjrKIptQeuFfzon5jFMP//PdqV1xlQsrM53r/85l01p7Zftl/pug7nFULmWobFeM
 YAQ==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On 2026-07-27 20:43 +0000, Konstantin Ryabitsev wrote:
> On 2026-07-18 00:37 +0200, Christian Brauner wrote:
> > The review TUI binds all mail visibility to the revision a series is
> > tracked at: 'e' opens only the tracked thread, unread badges exist
> > only on the series row, and u/U updates poll only the tracked
> > revision.  Earlier versions of a series -- and the discussion that
> > shaped it -- are invisible even though the revisions catalog knows
> > they exist.
> 
> I'm sitting on this merely because I'd like to get 0.16 out first and 
> this seems like a feature that should land after that release is out.

Thank you for the update. I wasn't sure whether I should ping or not.
This was helpful!

