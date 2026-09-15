Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACF5399CEC
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503466; cv=none; b=KQKHcayFBgrJ24EiNqClsT5vd9Zf+Ny+4Be1/hrG/xOp0RZsfRA4aCltk44JEXqTSVObHfanKlaO4r4xC6NGy+8fAcmJVgfW++FnSOVH0HjT2RniYQ1yRDtXB3ADOTawMB9tFIGFAnJLFAPsLNYF+ZU+BsGo7J7qMXLJ5MEqpgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503466; c=relaxed/simple;
	bh=vb8AQYj/bYitlBRTGzYXOB5lsSsetRlqhzuxnWo7Ct8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=p0wJ8QP3QS3+wdxDr1tc5h0JcbsCmkAZUFdaiGHFa7vLbk6zgGzm6IroEAXv432UuWrj5vkYHJWR+AyBmIchFKmLFhxUJ2v92UqoJxIer0dhupYHbOUAjsHFJOHw+6G2m8vuUvjstLWqmvP+f+1LWpq92YZKXf5OPAQ3JQhSXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pI/wSjKU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pI/wSjKU"
Received: by smtp.kernel.org (Postfix)
	id 7C3221F00893; Tue, 15 Sep 2026 20:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3658D1F000FF;
	Tue, 15 Sep 2026 20:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789503464;
	bh=EGLK+K6Q2LQXrw//qezz9kIKL4eUu5XhTqNuKkNzSbw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=pI/wSjKUbPd5HMxXNq2s6YIoM9XY049zcE9P5h4GwYHmdrkZwI0Q6b1DM1kpSlhmI
	 aW/FLKQA6NrxZPYUZth4k1IuGjQDSNtbRRmIcEHM3GHGAKjQSWqYxJVQAvXgHqRrS6
	 utUD6tlOKwkC7iTHG6JFKIGVpXBmYTphnXKSyOGU=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] review: separate revisions from paths when diffing
 a commit
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Cc: tools@kernel.org
In-Reply-To: <20260904145941.1414684-1-khorenko@virtuozzo.com>
References: <20260904145941.1414684-1-khorenko@virtuozzo.com>
Date: Tue, 15 Sep 2026 20:17:40 +0000
Message-Id: <178950346086.53447.16245783490381182829.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=vb8AQYj/bYitlBRTGzYXOB5lsSsetRlqhzuxnWo7Ct8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJWLn9m99yOLX3bnf8v/Hj/i704tKFmevBckeRcOdEcn
 auK+4TzO0pZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAExE6g0jw9WIBVZbZPdaOO1+
 0mP65f6m+bn/Hi5tVp2YW1SQ4rLnjAEjw1vjP6tLDphaHmJUnmM5q/JH62+B2yunrn6aXPBw4bn
 dxxkB
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Reviewing a series fails with "Could not generate diff" whenever the
> work tree contains a file or directory named after the commit being
> diffed:
> 
>   $ mkdir 1b7771486ae3d9dec8959dbb4da51e535364fb8e
>   $ git diff 1b7771486ae3d9dec8959dbb4da51e535364fb8e~1 \
>             1b7771486ae3d9dec8959dbb4da51e535364fb8e
>   fatal: ambiguous argument '1b7771486ae3d9dec8959dbb4da51e535364fb8e':
>   both revision and filename
> 
> Any tooling that names its output after a bare SHA (review notes,
> logs, build artifacts) can shadow the revision this way. Both
> arguments here are always revisions, so terminate them with '--' at
> every site that diffs a commit against its parent.

Good catch, but I think it's not quite complete -- the same problem
would occur every place we do "git show" between two commit-id SHAs. I
can either take this as-is and add these myself, or you can send a v2
that also fixes this for "git show" calls. What do you prefer?

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
