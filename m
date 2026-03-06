Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2E749C
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 00:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756112; cv=none; b=GzqnyjpHfiBw0E1oYyfLM6og7rKlvjZI+PwB1rH5J2eECgUYw1QGcNX9XABr1eTnm8ouBnJg7JfwNIVqUuYyQAeT3WqBTwRBqzNR7q1+CMJ7x4tvbfD5IseqZ6XouCx5N9/0pD+Yyb6IF2eHsv1/2H19zOM2eWi9Mri77kfLzT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756112; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=MtxEeUsOb9ALvcLGG3BraPaZy/8iJ1qGWJujkTfaSOSyFPA0OYAxVFnsagOKz+UAuuNd9jGIKQ16+l5TSANWqIlEFZRw1lXrWLw+n1M7B/KQmkDtAyrCLZwQIMFcGB/n5SIHVCSlu8T67YfF1H7Xi6FhlaQopzZCheWOEDRojKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVfW2YZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVfW2YZP"
Received: by smtp.kernel.org (Postfix)
	id 3F73BC2BC87; Fri,  6 Mar 2026 00:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25148C116C6;
	Fri,  6 Mar 2026 00:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756112;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=XVfW2YZPUiHqOoUbfcAa8lhACJ9HuVBJXG0uE9CiiHfNqvxC7MC5IW/6YYUgzjcSd
	 IG9N+1ZrefRfuGWeRX60Phiz29yCH8AnU7oO2A3+4Tcvzar1oy/0swOc637xnlfTl1
	 pHfRf9cOBsAyjNBrtT4YdawFG8ojTD1fC27pVX7B3ImRPkxe2Avuqah6QTTAMs2EiH
	 x6K/c8IUiQ5OTxxb+bmlzptg8l/NrHe+bqNyojIF+HJmk2V3YvzRP1KjDwkd9cpakj
	 xIqRdxt1QjLB0XFuGWAWjUSGoLilAu3okNOUJezyuK9t4ANDY6qpjbCt5gsNqzi4r/
	 GvRAShej99cPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05C933808200;
	Fri,  6 Mar 2026 00:15:13 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: bugbot+b4@kernel.org, tools@kernel.org, git@n0toose.net
Message-ID: <20260306-b74b65e338f013578000e47b2c844b7b163a831f3082daf04de72604404c25abf-c9da0039d3e3@git.kernel.org>
In-Reply-To: <997706185.418493.1772314169554@app.mailbox.org>
References: <997706185.418493.1772314169554@app.mailbox.org>
Subject: Re: b4 sanitizes quotation marks out of my name
X-Git-Bug-Id: 74b65e338f013578000e47b2c844b7b163a831f3082daf04de72604404c25abf
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Mar 2026 00:15:13 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)

