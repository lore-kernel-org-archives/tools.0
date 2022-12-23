Received: from cyclamen.worldbroken.com (cyclamen.worldbroken.com [45.79.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5042015BD
	for <tools@linux.kernel.org>; Fri, 23 Dec 2022 22:28:02 +0000 (UTC)
Received: from [192.168.11.7] (unknown [71.219.72.184])
	by cyclamen.worldbroken.com (Postfix) with ESMTPSA id 5B77540182
	for <tools@linux.kernel.org>; Fri, 23 Dec 2022 17:22:34 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 cyclamen.worldbroken.com 5B77540182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worldbroken.com;
	s=default; t=1671834154;
	bh=6jRl57wS5XDwq8PHkdJDQStp5ss+QnJd9tEd7DeZSyk=;
	h=Date:To:From:Subject:From;
	b=K04BGtvAlMIPH16NS4IOPxFkObM5hUu/k6/e+tgiWUxQ3xpX9H8FiXFmlbEhsQmzJ
	 DCfh5iRW32+Hf5rhjrtIuPp/wursrn9IyvdeLG5kS0t2vaQ/YBmc3Db1Huq0Qt9RVv
	 RGqZqbaDWdOLXVSfLBHsAmfKXyACUfilh61YZNAg=
Message-ID: <01304af2-3412-8385-3336-4dda9104336e@worldbroken.com>
Date: Fri, 23 Dec 2022 17:22:27 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: tools@linux.kernel.org
From: Bill Pemberton <wfp5p@worldbroken.com>
Subject: b4 and abbrevCommit
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	cyclamen.worldbroken.com

I've discovered that b4 will not work correctly if you have abbrevCommit 
set in your .gitconfig file.  For example, a simple 'b4 prep 
--edit-cover' will result in the cover letter not actually changing. 
You'll get the edit process and such, but after the fact the commit with 
the cover letter will still be the default one that b4 creates.

I assume all calls to git log and git show need the --no-abbrev-commit 
option.  Or at least this gotcha should be documented.

-- 
Bill
