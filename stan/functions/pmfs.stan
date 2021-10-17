// discretised truncated lognormal pmf
vector discretised_lognormal_pmf(int[] y, real mu, real sigma, int max_val) {
  int n = num_elements(y);
  vector[n] pmf;
  real small = 1e-5;
  real c_sigma = fmax(small, sigma);
  real c_mu = fmax(small, mu);
  vector[n] adj_y = to_vector(y) + small;
  vector[n] upper_y = (log(adj_y + 1) - c_mu) / c_sigma;
  vector[n] lower_y = (log(adj_y) - c_mu) / c_sigma;
  real max_cdf = normal_cdf((log(max_val + small) - c_mu) / c_sigma, 0.0, 1.0);
  real min_cdf = normal_cdf((log(small) - c_mu) / c_sigma, 0.0, 1.0);
  real trunc_cdf = max_cdf - min_cdf;
  for (i in 1:n) {
    pmf[i] = (normal_cdf(upper_y[i], 0.0, 1.0) - normal_cdf(lower_y[i], 0.0, 1.0)) /
    trunc_cdf;
  }
  return(pmf);
}

// reverse a mf
vector reverse_mf(vector pmf, int max_pmf) {
  vector[max_pmf] rev_pmf;
  for (d in 1:max_pmf) {
    rev_pmf[d] = pmf[max_pmf - d + 1];
  }
  return rev_pmf;
}
