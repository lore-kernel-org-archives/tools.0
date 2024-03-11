Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE493D970
	for <tools@linux.kernel.org>; Mon, 11 Mar 2024 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710164700; cv=none; b=P/OO/OYT10vSPzFLHjQI5htrT0zlE/hjzTxz5GgwOuOJ9ipIgtrh9mxbylAAf+8QVWJpZX2wfNDGI+7/QM2wIA22/SR35/n70bo1BvjYA3VIjsmxEji+IRclqDz2cmG5tg9U8O95Szd9TORV5wV48lgdKq6qu13bBgR2yT3knr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710164700; c=relaxed/simple;
	bh=+TxQjDKKXyPiWm5FQn/PDSFafE9CC9brKojpmGxpr4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEJshCCYHtojLjti6ylI97nf7Cqc0cICc+F4b1d+zJD3ips2CFjZOaBAXHTb9+B7ApQQ5dJ+1PVM0tUuXxn3K7OLYjaq0pvLE2c/SYM2MdW8zGc5bKKrHYde4UaH9IsUczswHbvNOKcEAQAPrEA4OKWqLmKlZDSqQtRQFh1pnQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hlLl2mbX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hlLl2mbX"
Received: by smtp.kernel.org (Postfix)
	id 7AA92C43390; Mon, 11 Mar 2024 13:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E96CC433C7;
	Mon, 11 Mar 2024 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1710164699;
	bh=+TxQjDKKXyPiWm5FQn/PDSFafE9CC9brKojpmGxpr4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlLl2mbXtYD6GJDLlTaJzsahSQhKDT4woLQ4kwnc4SINd5FjAk02WJB9lr1t8rwu1
	 qOD4wjUB0N6QUBHrSGJDV/TRIUnQI/S2/j4jSqHX7w8CDmlpb+xYaPlEheo8K9+aaF
	 +ESLxCRd0OXJkcnll0QicAxH+B8dInH8nSp98uv8=
Date: Mon, 11 Mar 2024 09:44:54 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: tools@kernel.org
Subject: Re: b4 custom git diff options (like -B)
Message-ID: <20240311-gifted-guillemot-from-nibiru-8a3bbe@lemur>
References: <12393372.O9o76ZdvQC@g550jk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12393372.O9o76ZdvQC@g550jk>

On Sun, Mar 10, 2024 at 12:21:20PM +0100, Luca Weiss wrote:
> I'm looking for a way to make b4 use the "-B" ("--break-rewrites") option for 
> git diff when sending a patch where this option makes the diff way more 
> readable than without.
> 
> I currently don't see any way to either tell b4 to use this option, or to tell 
> git to (temporarily) use this option when generating any diff.

Yes, this should exist.

bugbot assign to me
