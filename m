Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017795F
	for <tools@linux.kernel.org>; Tue, 16 Mar 2021 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/k6nGx+dCaW2ZEVbP4sof5X5DOeZiK5lC2cQy6dqTZs=; b=AnT72rjAcWdUyczAwp21hdWw3g
	rMJVAQAhqXBLEfyhQYQZyy3cQm6Mk2Uy9eNuS+UUIOJKR5THsrM+fRa62xGxE6jb+HH0CjinWXs4K
	jm5QSl07hDI/lNwL4tFKgHH10m35NyHkq4wc8CN8d+YER2i190OI805yxSODuBq+hTeRUDFlNrf29
	aa9t22DV/HCDF4t8kt6tbLKm7W5dPq1kfpSF0mAI5nZ5JgGEY/4i3DNU85KAOekncFZwuXorXQWBl
	GQ+G0ZZ2GoSsYSIVmsYT4CEYWIpADO4MMuuoiYZXBCm+gn9wRrbjf+Xhzdx43Sml9d4GwuEHVHApc
	NdjButRw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1lMGBb-001n1E-5h
	for tools@linux.kernel.org; Tue, 16 Mar 2021 20:21:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DC4533012DF
	for <tools@linux.kernel.org>; Tue, 16 Mar 2021 21:21:02 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id CCD342CEB6E02; Tue, 16 Mar 2021 21:21:02 +0100 (CET)
Date: Tue, 16 Mar 2021 21:21:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: tools@linux.kernel.org
Subject: [REQ] b4: Allow -m from stdin
Message-ID: <YFETLu8TKWI2WlSF@hirez.programming.kicks-ass.net>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Would it be possible for b4 to consume an mbox from stdin; something
like:

	b4 am -sl -m - -o -

The use case is pipeing a whole thread into it from mutt without it
having to access the web (which might not be available etc..).

Thnx!
