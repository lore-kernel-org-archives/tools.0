Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144DC432BE6
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785503699; cv=none; b=Snj749V3MF3tw7BalH36QNbTXfXdct64Qjxp+SucWCtvDsmGrFVAxNFLY229YkGjNFnQ6fl05e8uA3gkEAhUAR1UTw+zhmng/ZYset9cCe8zHgLqXzWpkN5Gq4kdDP/uGS3wesSILDyIx78atpZXMnZRo0YQq+X+A5vQ0QsCVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785503699; c=relaxed/simple;
	bh=Ve8bxQhHLLF5INV5bzNsrF8xpuE2yWxZFPcT6rUt10w=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=dulK3ArlKnCdk1yBcrEoQSqWRnEquCVlZYa3su7n6JIQPG0sKCvAGdKgstvlezYbgp34J5hiO3OAf8MVtdhflVa3xiLQbrNk6MtHMd6Lz/cq/NogehK402uulO7T2GKcHFsw9lEYKEUXP3mlpcMBK2udITPiX5PDsSBvNR5cuGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2NQkqsv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2NQkqsv"
Received: by smtp.kernel.org (Postfix)
	id 678D21F00A3A; Fri, 31 Jul 2026 13:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E021F000E9;
	Fri, 31 Jul 2026 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785503697;
	bh=fG4yjduamCXAbrioNlE6K9blxiu023JHciLjFhPPu8g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=I2NQkqsvpTmVqswynO1LMSlcidScNCaufq3q8cI2uASUYnRU4h1lCLZeJ+CYqTAX2
	 SX1o8rG+LuK0BV67e7+CY/TzzOkffyCrB+eNfrnNZe7PmQ6bdJr9fSNXQuJp4k0sxl
	 oc3yAregJIx9BCDyJdTkhPp6RVtmQgn/M+muKtR/ynkZ8p7YtTfEHTYDVijnsRU8s8
	 SwmhDgioH1XwvxZ9ia7qb6zKrBZhZ9GnxEzQ+vGVACKYSJnEv2q8ZVECP4q5nHkMgz
	 c+7n4YJU5r8z4Uaa0acMgc0LMN0Lu9bOZ8dysnE44lG4PX/QYDgVOIB4VkCf0Mx3VX
	 r6l0kdi9hkJWQ==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 00/27] Stop the editor branch guard from eating
 review replies
From: Christian Brauner <brauner@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v1-0-de68a7c8e4cb@kernel.org>
Date: Fri, 31 Jul 2026 15:14:54 +0200
Message-Id: <20260731-optisch-verewigen-erlauben-3feea5e6b1c2@brauner>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=518; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Ve8bxQhHLLF5INV5bzNsrF8xpuE2yWxZFPcT6rUt10w=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlzL/AEfKVLUJM5ktptOJF29kiW+SMGZSN7hlnZEp/e
 NV89PKMjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIls6mf4K9Z615FV4sL26V0H
 ki3ZV2x+VNbG6i+9YJFQhu/603dcZRgZZl5vlG1wWyX8QmQl6/VNnhuvSG/ZbPcpl9n7r+990eU
 72AE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On 2026-07-31 11:20 +0200, Christian Brauner wrote:
> Reported from a live "b4 review tui" session. The reply editor sat open
> across a branch switch made in the same worktree from another terminal,
> and quitting the editor dumped the reply into /tmp and took the whole
> TUI down with a RuntimeError.
> 
> Digging into that turned up four separate problems, one patch each.

I'm about to send v2 soon. I found a few more bugs while using b4 review
tui this morning that I'm going to add into this series.

